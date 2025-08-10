# Script de preparación para CI/CD
# Garantiza que todos los archivos generados estén formateados correctamente

Write-Host "Preparando archivos para CI/CD..." -ForegroundColor Blue

# Limpiar build anterior
Write-Host "Limpiando build anterior..." -ForegroundColor Yellow
flutter clean | Out-Null

# Instalar dependencias
Write-Host "Instalando dependencias..." -ForegroundColor Yellow  
flutter pub get | Out-Null

# Generar localizaciones
Write-Host "Generando localizaciones..." -ForegroundColor Yellow
flutter gen-l10n | Out-Null

# Ejecutar build runner (como en CI)
Write-Host "Ejecutando build runner..." -ForegroundColor Yellow
dart run build_runner build --delete-conflicting-outputs | Out-Null

# Formatear código con parámetros exactos del CI
Write-Host "Formateando código..." -ForegroundColor Yellow
dart format --line-length 80 lib test | Out-Null

# Verificar estado
$status = git status --porcelain
if ($status) {
    Write-Host "Cambios detectados, preparando commit..." -ForegroundColor Green
    Write-Host $status
    
    git add .
    git commit -m "chore: regenerar y formatear archivos para consistencia CI/CD"
    
    Write-Host "Cambios listos para push. Ejecuta: git push" -ForegroundColor Green
} else {
    Write-Host "Todo está sincronizado con CI/CD" -ForegroundColor Green
}

Write-Host ""
Write-Host "Para verificar manualmente:" -ForegroundColor Cyan
Write-Host "   dart format --line-length 80 --set-exit-if-changed lib test"
Write-Host ""
