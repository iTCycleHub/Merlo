# Script de preparación para CI/CD
# Garantiza que todos los archivos generados estén formateados correctamente

Write-Host "Preparando archivos para CI/CD..." -ForegroundColor Blue

# Limpiar build anterior
Write-Host "Limpiando build anterior..." -ForegroundColor Yellow
flutter clean | Out-Null

# Instalar dependencias
Write-Host "Instalando dependencias..." -ForegroundColor Yellow  
flutter pub get | Out-Null

# Generar localizaciones (los archivos no se versionan, solo verificamos que funcione)
Write-Host "Generando localizaciones..." -ForegroundColor Yellow
flutter gen-l10n | Out-Null

# Ejecutar build runner (como en CI)
Write-Host "Ejecutando build runner..." -ForegroundColor Yellow
dart run build_runner build --delete-conflicting-outputs | Out-Null

# Formatear código con parámetros exactos del CI (excluyendo archivos generados)
Write-Host "Formateando código..." -ForegroundColor Yellow
dart format --line-length 80 lib test --exclude="lib/gen/**" | Out-Null

# Ejecutar análisis de código
Write-Host "Analizando código..." -ForegroundColor Yellow
$analyzeResult = flutter analyze lib test
if ($LASTEXITCODE -ne 0) {
    Write-Host "Errores de análisis encontrados. Intentando corrección automática..." -ForegroundColor Yellow
    dart fix --apply lib test | Out-Null
    
    # Verificar de nuevo
    $analyzeResult = flutter analyze lib test
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Aún hay errores de análisis que requieren corrección manual:" -ForegroundColor Red
        Write-Host $analyzeResult
    } else {
        Write-Host "Errores de análisis corregidos automáticamente" -ForegroundColor Green
    }
}

# Verificar estado (solo archivos que se deben versionar)
$status = git status --porcelain | Where-Object { $_ -notmatch "lib/gen/" }
if ($status) {
    Write-Host "Cambios detectados, preparando commit..." -ForegroundColor Green
    Write-Host $status
    
    git add .
    git commit -m "chore: actualizar configuración CI y gitignore para archivos generados"
    
    Write-Host "Cambios listos para push. Ejecuta: git push" -ForegroundColor Green
} else {
    Write-Host "Todo está sincronizado con CI/CD" -ForegroundColor Green
}

Write-Host ""
Write-Host "Nota: Los archivos de localización ahora se generan automáticamente en CI" -ForegroundColor Cyan
Write-Host "Para verificar manualmente:" -ForegroundColor Cyan
Write-Host "   dart format --line-length 80 --set-exit-if-changed lib test --exclude='lib/gen/**'"
Write-Host ""
