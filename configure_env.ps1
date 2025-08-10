# Script para configurar el entorno temporal
$env:PATH += ";C:\Program Files\Git\bin"

Write-Host "✅ PATH actualizado con Git" -ForegroundColor Green
Write-Host "Verificando herramientas:" -ForegroundColor Yellow

# Verificar Git
try {
    $gitVersion = git --version
    Write-Host "✅ Git: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Error con Git" -ForegroundColor Red
}

# Verificar Flutter
try {
    $flutterVersion = flutter --version | Select-Object -First 1
    Write-Host "✅ Flutter: $flutterVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Error con Flutter" -ForegroundColor Red
}

Write-Host ""
Write-Host "🚀 Comandos disponibles:" -ForegroundColor Cyan
Write-Host "  flutter pub get                                    # Instalar dependencias"
Write-Host "  dart run build_runner build --delete-conflicting-outputs # Generar código"
Write-Host "  flutter run -d chrome lib/main_development.dart    # Ejecutar en Chrome"
Write-Host "  flutter test                                       # Ejecutar tests"
Write-Host ""
