# Arquitectura de Merlo

## Introducción

Merlo implementa Clean Architecture siguiendo los principios de Robert C. Martin, adaptados específicamente para Flutter y las necesidades de una plataforma de gestión comercial.

## Estructura de Capas

### 1. Domain Layer (Capa de Dominio)

La capa más interna que contiene la lógica de negocio pura:

```
domain/
├── entities/           # Entidades de negocio
├── repositories/       # Contratos de repositorios
├── usecases/          # Casos de uso de la aplicación
└── value_objects/     # Objetos de valor
```

#### Entities (Entidades)
Objetos que representan conceptos de negocio:
- `User` - Usuario del sistema
- `Product` - Producto comercializable
- `Customer` - Cliente de la plataforma
- `Order` - Pedido/orden de compra
- `AIRecommendation` - Recomendación de IA

#### Use Cases (Casos de Uso)
Implementan la lógica de negocio específica:
- `AuthenticateUser`
- `CreateProduct`
- `ManageCustomers`
- `GenerateAIInsights`
- `ProcessOrder`

### 2. Data Layer (Capa de Datos)

Implementa los contratos del dominio y maneja fuentes de datos:

```
data/
├── datasources/       # Fuentes de datos
│   ├── local/        # SharedPreferences, SQLite
│   └── remote/       # APIs REST, GraphQL
├── models/           # Modelos de datos (JSON, DB)
└── repositories/     # Implementaciones de repositorios
```

#### Data Sources
- **Local**: Cache, configuraciones, datos offline
- **Remote**: APIs de autenticación, productos, IA, pagos

#### Models
Representación de datos para serialización:
- `UserModel` - Mapeo JSON ↔ User entity
- `ProductModel` - Datos de productos con precios, inventario
- `CustomerModel` - Información de clientes

### 3. Presentation Layer (Capa de Presentación)

Maneja la interfaz de usuario y el estado:

```
presentation/
├── blocs/            # BLoCs para manejo de estado
├── pages/            # Pantallas de la aplicación
├── widgets/          # Componentes UI reutilizables
└── utils/            # Utilidades de UI
```

## Features Principales de Merlo

### 1. Authentication (Autenticación)
```
features/auth/
├── domain/
│   ├── entities/user.dart
│   ├── repositories/auth_repository.dart
│   └── usecases/
│       ├── login_user.dart
│       ├── register_user.dart
│       └── logout_user.dart
├── data/
│   ├── datasources/
│   │   ├── auth_local_datasource.dart
│   │   └── auth_remote_datasource.dart
│   ├── models/user_model.dart
│   └── repositories/auth_repository_impl.dart
└── presentation/
    ├── blocs/auth_bloc.dart
    ├── pages/
    │   ├── login_page.dart
    │   └── register_page.dart
    └── widgets/auth_form.dart
```

### 2. Product Management (Gestión de Productos)
```
features/products/
├── domain/
│   ├── entities/
│   │   ├── product.dart
│   │   └── category.dart
│   ├── repositories/product_repository.dart
│   └── usecases/
│       ├── create_product.dart
│       ├── update_product.dart
│       ├── delete_product.dart
│       └── get_products.dart
└── presentation/
    ├── blocs/product_bloc.dart
    ├── pages/
    │   ├── products_list_page.dart
    │   ├── product_detail_page.dart
    │   └── create_product_page.dart
    └── widgets/
        ├── product_card.dart
        └── product_form.dart
```

### 3. Customer Management (Gestión de Clientes)
```
features/customers/
├── domain/
│   ├── entities/
│   │   ├── customer.dart
│   │   └── customer_interaction.dart
│   └── usecases/
│       ├── add_customer.dart
│       ├── update_customer.dart
│       └── get_customer_history.dart
└── presentation/
    ├── blocs/customer_bloc.dart
    ├── pages/
    │   ├── customers_list_page.dart
    │   └── customer_detail_page.dart
    └── widgets/customer_card.dart
```

### 4. AI Insights (Insights de IA)
```
features/ai_insights/
├── domain/
│   ├── entities/
│   │   ├── insight.dart
│   │   └── recommendation.dart
│   └── usecases/
│       ├── generate_sales_insights.dart
│       ├── get_product_recommendations.dart
│       └── analyze_customer_behavior.dart
└── presentation/
    ├── blocs/ai_insights_bloc.dart
    ├── pages/ai_dashboard_page.dart
    └── widgets/
        ├── insight_card.dart
        └── recommendation_widget.dart
```

## Inyección de Dependencias

Utilizamos `GetIt` con `Injectable` para DI automática:

```dart
// core/di/app_module.dart
@module
abstract class AppModule {
  @singleton
  AuthRepository get authRepository => AuthRepositoryImpl();
  
  @singleton
  ProductRepository get productRepository => ProductRepositoryImpl();
}
```

## Estado Global

### BLoCs Principales
- `AuthBloc` - Estado de autenticación
- `ProductBloc` - Estado de productos
- `CustomerBloc` - Estado de clientes
- `AIInsightsBloc` - Estado de insights de IA

### Comunicación entre BLoCs
Usando `StreamSubscription` y eventos para comunicación:

```dart
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._authBloc) {
    _authSubscription = _authBloc.stream.listen((authState) {
      if (authState is AuthenticationFailure) {
        add(ClearProductsEvent());
      }
    });
  }
}
```

## Testing

### Estructura de Tests
```
test/
├── features/
│   ├── auth/
│   ├── products/
│   └── customers/
├── core/
└── helpers/
    ├── test_helper.dart
    └── pump_app.dart
```

### Tipos de Tests
1. **Unit Tests**: Casos de uso, BLoCs, repositories
2. **Widget Tests**: Páginas y widgets individuales
3. **Integration Tests**: Flujos completos

## Configuración por Ambiente

### Development
- Base URL: `https://dev-api.merlo.com`
- Logging: Verbose
- Analytics: Disabled

### Staging
- Base URL: `https://staging-api.merlo.com`
- Logging: Info
- Analytics: Limited

### Production
- Base URL: `https://api.merlo.com`
- Logging: Error only
- Analytics: Full

## Convenciones de Código

### Nomenclatura
- **Entities**: PascalCase (User, Product)
- **Use Cases**: PascalCase + descriptivo (AuthenticateUser)
- **BLoCs**: PascalCase + Bloc suffix (AuthBloc)
- **Events**: PascalCase + Event suffix (LoginEvent)
- **States**: PascalCase + State suffix (AuthenticatedState)

### Estructura de Archivos
- Un archivo por clase
- Barrel files para exports (feature.dart)
- Importaciones relativas dentro del feature
- Importaciones absolutas entre features

### Manejo de Errores
```dart
abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class NetworkFailure extends Failure {}
class AuthenticationFailure extends Failure {}
class ValidationFailure extends Failure {}
```

## Flujo de Datos

1. **UI Trigger**: Usuario interactúa con UI
2. **Event Dispatch**: UI envía evento al BLoC
3. **Use Case Execution**: BLoC ejecuta caso de uso
4. **Repository Call**: Caso de uso llama repositorio
5. **Data Fetch**: Repositorio obtiene datos
6. **State Update**: BLoC actualiza estado
7. **UI Rebuild**: UI se reconstruye automáticamente

Este flujo garantiza unidireccionalidad y predictibilidad en el manejo de datos.
