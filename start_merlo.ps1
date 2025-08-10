# Script de inicio rápido para Merlo
# Asegura que Git esté en el PATH antes de ejecutar comandos de Flutter

Write-Host "🚀 Iniciando Merlo..." -ForegroundColor Green

# Asegurar que Git esté en el PATH
$env:PATH += ";C:\Program Files\Git\bin"

# Crear alias para comandos comunes
function Start-MerloDev {
    Write-Host "🌐 Iniciando aplicación en modo desarrollo..." -ForegroundColor Blue
    flutter run -d chrome lib/main_development.dart
}

function Build-MerloCode {
    Write-Host "🔧 Generando código..." -ForegroundColor Blue
    dart run build_runner build --delete-conflicting-outputs
}

function Get-MerloDeps {
    Write-Host "📦 Instalando dependencias..." -ForegroundColor Blue
    flutter pub get
}

function Test-Merlo {
    Write-Host "🧪 Ejecutando tests..." -ForegroundColor Blue
    flutter test
}

# Exports
New-Alias -Name merlo-dev -Value Start-MerloDev -Force
New-Alias -Name merlo-build -Value Build-MerloCode -Force
New-Alias -Name merlo-deps -Value Get-MerloDeps -Force
New-Alias -Name merlo-test -Value Test-Merlo -Force

Write-Host ""
Write-Host "✅ Entorno configurado correctamente!" -ForegroundColor Green
Write-Host ""
Write-Host "🎯 Comandos disponibles:" -ForegroundColor Cyan
Write-Host "  merlo-dev     # Ejecutar aplicación en desarrollo"
Write-Host "  merlo-build   # Generar código"
Write-Host "  merlo-deps    # Instalar dependencias"
Write-Host "  merlo-test    # Ejecutar tests"
Write-Host ""
Write-Host "💡 También puedes usar los comandos normales de Flutter:"
Write-Host "  flutter run -d chrome lib/main_development.dart"
Write-Host "  dart run build_runner build --delete-conflicting-outputs"
Write-Host ""

# Verificar que todo funcione
git --version | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Git funcionando correctamente" -ForegroundColor Green
} else {
    Write-Host "❌ Git no funcionando" -ForegroundColor Red
}

flutter --version | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Flutter funcionando correctamente" -ForegroundColor Green
} else {
    Write-Host "❌ Flutter no funcionando" -ForegroundColor Red
}
