#!/bin/bash

# Script de configuración para Merlo
# Asegúrate de tener Flutter instalado antes de ejecutar

echo "🚀 Configurando proyecto Merlo..."

# Verificar si Flutter está instalado
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter no está instalado. Por favor instala Flutter primero."
    echo "📖 Visita: https://docs.flutter.dev/get-started/install"
    exit 1
fi

echo "✅ Flutter encontrado"

# Verificar si FVM está instalado
if command -v fvm &> /dev/null; then
    echo "✅ FVM encontrado, usando FVM para comandos de Flutter"
    FLUTTER_CMD="fvm flutter"
    DART_CMD="fvm dart"
else
    echo "⚠️  FVM no encontrado, usando Flutter directamente"
    FLUTTER_CMD="flutter"
    DART_CMD="dart"
fi

# Instalar dependencias
echo "📦 Instalando dependencias..."
$FLUTTER_CMD pub get

if [ $? -eq 0 ]; then
    echo "✅ Dependencias instaladas correctamente"
else
    echo "❌ Error al instalar dependencias"
    exit 1
fi

# Generar código
echo "🔧 Generando código..."
$DART_CMD run build_runner build --delete-conflicting-outputs

if [ $? -eq 0 ]; then
    echo "✅ Código generado correctamente"
else
    echo "❌ Error al generar código"
    exit 1
fi

# Verificar configuración
echo "🔍 Verificando configuración..."
$FLUTTER_CMD doctor

echo ""
echo "🎉 ¡Configuración completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Ejecuta '$FLUTTER_CMD run lib/main_development.dart' para modo desarrollo"
echo "2. Revisa la documentación en docs/ARCHITECTURE.md"
echo "3. Comienza a desarrollar tu primer feature"
echo ""
echo "💡 Comandos útiles:"
echo "   - Desarrollo: $FLUTTER_CMD run lib/main_development.dart"
echo "   - Tests: $FLUTTER_CMD test"
echo "   - Build watch: $DART_CMD run build_runner watch"
echo "   - Análisis: $FLUTTER_CMD analyze"
