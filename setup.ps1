# Script de configuración para Merlo (Windows PowerShell)
# Asegúrate de tener Flutter instalado antes de ejecutar

Write-Host "🚀 Configurando proyecto Merlo..." -ForegroundColor Green

# Verificar si Flutter está instalado
try {
    $null = Get-Command flutter -ErrorAction Stop
    Write-Host "✅ Flutter encontrado" -ForegroundColor Green
} catch {
    Write-Host "❌ Flutter no está instalado. Por favor instala Flutter primero." -ForegroundColor Red
    Write-Host "📖 Visita: https://docs.flutter.dev/get-started/install" -ForegroundColor Yellow
    exit 1
}

# Verificar si Git está instalado
try {
    $null = Get-Command git -ErrorAction Stop
    Write-Host "✅ Git encontrado" -ForegroundColor Green
} catch {
    Write-Host "❌ Git no está instalado. Instalando Git..." -ForegroundColor Yellow
    try {
        winget install --id Git.Git -e --source winget
        Write-Host "✅ Git instalado correctamente" -ForegroundColor Green
        Write-Host "⚠️  Por favor reinicia VS Code para que Git sea reconocido correctamente" -ForegroundColor Yellow
    } catch {
        Write-Host "❌ Error al instalar Git" -ForegroundColor Red
        exit 1
    }
}

# Verificar si FVM está instalado
try {
    $null = Get-Command fvm -ErrorAction Stop
    Write-Host "✅ FVM encontrado, usando FVM para comandos de Flutter" -ForegroundColor Green
    $FlutterCmd = "fvm flutter"
    $DartCmd = "fvm dart"
} catch {
    Write-Host "⚠️  FVM no encontrado, usando Flutter directamente" -ForegroundColor Yellow
    $FlutterCmd = "flutter"
    $DartCmd = "dart"
}

# Instalar dependencias
Write-Host "📦 Instalando dependencias..." -ForegroundColor Blue
Invoke-Expression "$FlutterCmd pub get"

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Dependencias instaladas correctamente" -ForegroundColor Green
} else {
    Write-Host "❌ Error al instalar dependencias" -ForegroundColor Red
    exit 1
}

# Configurar soporte web si no existe
if (-not (Test-Path "web")) {
    Write-Host "🌐 Configurando soporte web..." -ForegroundColor Blue
    Invoke-Expression "$FlutterCmd create . --platforms=web"
}

# Generar localizaciones
Write-Host "🌍 Generando localizaciones..." -ForegroundColor Blue
Invoke-Expression "$FlutterCmd gen-l10n"

# Generar código
Write-Host "🔧 Generando código..." -ForegroundColor Blue
Invoke-Expression "$DartCmd run build_runner build --delete-conflicting-outputs"

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Código generado correctamente" -ForegroundColor Green
} else {
    Write-Host "❌ Error al generar código" -ForegroundColor Red
    exit 1
}

# Verificar configuración
Write-Host "🔍 Verificando configuración..." -ForegroundColor Blue
Invoke-Expression "$FlutterCmd doctor"

Write-Host ""
Write-Host "🎉 ¡Configuración completada!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Próximos pasos:" -ForegroundColor Yellow
Write-Host "1. Ejecuta '$FlutterCmd run -d chrome lib/main_development.dart' para modo desarrollo"
Write-Host "2. Revisa la documentación en docs/ARCHITECTURE.md"
Write-Host "3. Comienza a desarrollar tu primer feature"
Write-Host ""
Write-Host "💡 Comandos útiles:" -ForegroundColor Cyan
Write-Host "   - Desarrollo: $FlutterCmd run -d chrome lib/main_development.dart"
Write-Host "   - Tests: $FlutterCmd test"
Write-Host "   - Build watch: $DartCmd run build_runner watch"
Write-Host "   - Análisis: $FlutterCmd analyze"
Write-Host "   - Generar localizaciones: $FlutterCmd gen-l10n"
