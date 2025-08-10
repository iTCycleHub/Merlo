# Merlo

Desarrollo de una plataforma digital integral que facilite la gestión comercial tanto para empresas establecidas como para trabajadores independientes y emprendedores, proporcionando herramientas esenciales para la comercialización de productos y gestión de cartera de clientes, con inteligencia artificial como valor añadido para optimizar procesos.

## Arquitectura

Este proyecto implementa **Clean Architecture** basado en el template de [flutter-mobile-clean-architecture-template](https://github.com/adryanev/flutter-mobile-clean-architecture-template), proporcionando una estructura escalable y mantenible.

### Estructura del Proyecto

```
lib/
├── app/                    # Configuración de la aplicación
│   ├── router/            # Navegación y rutas
│   └── view/              # Widget principal de la app
├── core/                  # Funcionalidad compartida
│   ├── di/                # Inyección de dependencias
│   ├── domain/            # Entidades y casos de uso base
│   ├── extensions/        # Extensiones de Dart/Flutter
│   ├── presentation/      # Componentes UI reutilizables
│   ├── storages/          # Almacenamiento local
│   └── utils/             # Utilidades y constantes
├── features/              # Características de la aplicación
│   └── [feature_name]/
│       ├── data/          # Fuentes de datos y repositorios
│       ├── domain/        # Entidades, casos de uso, contratos
│       └── presentation/  # UI, BLoCs, páginas
├── l10n/                  # Internacionalización
├── shared/                # Widgets y lógica compartida
└── main_[environment].dart # Puntos de entrada por ambiente
```

### Principios de Clean Architecture

1. **Separation of Concerns**: Cada capa tiene responsabilidades específicas
2. **Dependency Rule**: Las dependencias apuntan hacia adentro (dominio)
3. **Independence**: Las capas son independientes de frameworks externos

### Capas

#### 1. Domain Layer (Dominio)
- **Entities**: Objetos de negocio puros
- **Use Cases**: Lógica de negocio específica
- **Repository Contracts**: Interfaces para acceso a datos

#### 2. Data Layer (Datos)
- **Repositories**: Implementación de contratos del dominio
- **Data Sources**: APIs, bases de datos, cache
- **Models**: Representación de datos (JSON, DB)

#### 3. Presentation Layer (Presentación)
- **Pages**: Pantallas de la aplicación
- **BLoCs/Cubits**: Manejo de estado
- **Widgets**: Componentes UI reutilizables

## Configuración del Ambiente de Desarrollo

### Prerrequisitos

1. **Flutter SDK**: Versión estable (3.6.0+)
2. **FVM** (recomendado): Para manejo de versiones de Flutter
3. **IDE**: VSCode o Android Studio con plugins de Flutter

### Instalación

1. **Instalar FVM** (opcional pero recomendado):
   ```bash
   dart pub global activate fvm
   fvm install stable
   fvm use stable
   ```

2. **Instalar dependencias**:
   ```bash
   # Con FVM
   fvm flutter pub get
   
   # Sin FVM
   flutter pub get
   ```

3. **Generar código**:
   ```bash
   # Con FVM
   fvm dart run build_runner build --delete-conflicting-outputs
   
   # Sin FVM
   dart run build_runner build --delete-conflicting-outputs
   ```

### Ambientes

El proyecto soporta múltiples ambientes:

- **Development**: `main_development.dart`
- **Staging**: `main_staging.dart`
- **Production**: `main_production.dart`

Para ejecutar en diferentes ambientes:

```bash
# Development
fvm flutter run lib/main_development.dart

# Production
fvm flutter run lib/main_production.dart
```

## Tecnologías Principales

### State Management
- **BLoC/Cubit**: Para manejo de estado reactivo
- **RxDart**: Para programación reactiva avanzada

### Navegación
- **GoRouter**: Navegación declarativa con deep linking

### Inyección de Dependencias
- **GetIt + Injectable**: Inyección de dependencias automática

### Networking & Storage
- **SharedPreferences**: Almacenamiento local simple
- **Dartz**: Programación funcional (Either, Option)

### UI/UX
- **Flutter ScreenUtil**: Responsive design
- **Google Fonts**: Tipografías
- **Flutter Native Splash**: Splash screen nativo

### Testing
- **BlocTest**: Testing de BLoCs
- **Mocktail**: Mocking para tests
- **Very Good Analysis**: Linting estricto

## Próximos Pasos

1. **Instalar Flutter y FVM** en tu sistema
2. **Ejecutar los comandos de instalación** mencionados arriba
3. **Crear tu primer feature** siguiendo la estructura establecida
4. **Configurar CI/CD** usando los workflows en `.github/`

### Crear un Nuevo Feature

Para crear un nuevo feature, sigue esta estructura:

```
features/
└── mi_feature/
    ├── mi_feature.dart                 # Barrel file
    ├── data/
    │   ├── datasources/
    │   ├── models/
    │   └── repositories/
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── usecases/
    └── presentation/
        ├── blocs/
        ├── pages/
        └── widgets/
```

---
