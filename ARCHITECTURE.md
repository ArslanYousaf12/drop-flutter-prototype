# Drop Prototype - Architecture Documentation

## Clean Architecture Overview

This application follows Clean Architecture principles with clear separation of concerns across three distinct layers.

## 📊 Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         PRESENTATION LAYER                          │
│                    (UI, Widgets, State Management)                  │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌────────────────────┐     ┌──────────────────────────────────┐  │
│  │  Product Feed      │     │  Product Detail                  │  │
│  │  Screen            │────▶│  Screen                          │  │
│  │  - GridView        │     │  - Hero Image                    │  │
│  │  - Pull-to-Refresh │     │  - Product Info                  │  │
│  │  - Shimmer Loading │     │  - Back Navigation               │  │
│  └────────────────────┘     └──────────────────────────────────┘  │
│           │                              │                          │
│           │                              │                          │
│           ▼                              ▼                          │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │           Riverpod Providers (State Management)               │ │
│  │  - ProductListProvider (AsyncNotifier)                        │ │
│  │  - ProductDetailProvider (Family)                             │ │
│  │  - Handles: Loading, Data, Error states                       │ │
│  └───────────────────────────────────────────────────────────────┘ │
│                                │                                    │
└────────────────────────────────┼────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────────┐
│                          DOMAIN LAYER                               │
│                   (Business Logic, Entities)                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │              ProductRepository Interface                       │ │
│  │  + getAllProducts(): Future<List<ProductEntity>>              │ │
│  │  + getProductById(id): Future<ProductEntity>                  │ │
│  │  + getProductsByCategory(cat): Future<List<ProductEntity>>    │ │
│  └───────────────────────────────────────────────────────────────┘ │
│                                                                     │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │              ProductEntity (Business Object)                   │ │
│  │  - id: String                                                  │ │
│  │  - title: String                                               │ │
│  │  - description: String                                         │ │
│  │  - price: double                                               │ │
│  │  - imageUrl: String                                            │ │
│  │  - category: String                                            │ │
│  │  - createdAt: DateTime                                         │ │
│  └───────────────────────────────────────────────────────────────┘ │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────────┐
│                           DATA LAYER                                │
│            (Data Sources, Models, Repository Implementation)        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │         ProductRepositoryImpl (Implementation)                 │ │
│  │  Implements: ProductRepository                                 │ │
│  │  - Converts Models ↔ Entities                                 │ │
│  │  - Handles errors and exceptions                               │ │
│  │  - Delegates to data source                                    │ │
│  └─────────────────────────────┬─────────────────────────────────┘ │
│                                │                                    │
│                                ▼                                    │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │          Product Model (@freezed, @JsonSerializable)           │ │
│  │  - Immutable data class                                        │ │
│  │  - JSON serialization                                          │ │
│  │  - copyWith, ==, hashCode                                      │ │
│  │  - toEntity() / fromEntity()                                   │ │
│  └─────────────────────────────┬─────────────────────────────────┘ │
│                                │                                    │
│                                ▼                                    │
│  ┌───────────────────────────────────────────────────────────────┐ │
│  │         MockSupabaseDataSource (Data Source)                   │ │
│  │  - Returns List<Product> (models)                              │ │
│  │  - 15 mock products across 4 categories                        │ │
│  │  - Simulates 500ms network delay                               │ │
│  │  - JSON structure matches Supabase format                      │ │
│  │  → Easy to swap with real SupabaseDataSource                   │ │
│  └───────────────────────────────────────────────────────────────┘ │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 🔄 Data Flow

### Reading Data (Product Feed)

```
User Opens App
      │
      ▼
ProductFeedScreen
      │
      ▼
Watches productListProvider
      │
      ▼
Provider calls build()
      │
      ▼
ProductRepositoryImpl.getAllProducts()
      │
      ▼
MockSupabaseDataSource.getAllProducts()
      │
      ▼
Returns List<Product> (models)
      │
      ▼
Repository converts to List<ProductEntity>
      │
      ▼
Provider emits AsyncValue.data(entities)
      │
      ▼
UI rebuilds with product grid
      │
      ▼
User sees products ✅
```

### Navigation Flow

```
User Taps Product Card
      │
      ▼
HapticFeedback.lightImpact()
      │
      ▼
context.goToProductDetail(productId)
      │
      ▼
GoRouter navigates to /product/:id
      │
      ▼
ProductDetailScreen builds
      │
      ▼
Watches productDetailProvider(productId)
      │
      ▼
Provider fetches product by ID
      │
      ▼
Repository → DataSource → Model → Entity
      │
      ▼
UI shows product detail with Hero animation ✅
```

## 🎯 Key Architectural Decisions

### 1. Dependency Rule

Dependencies only point **inward**:
- Presentation → Domain
- Data → Domain
- Domain → Nothing (pure Dart)

### 2. Dependency Inversion

```
High-level (Domain)      Low-level (Data)
     │                        │
     │ defines                │ implements
     ▼                        ▼
ProductRepository ◄──── ProductRepositoryImpl
```

Domain defines interfaces, Data implements them. This allows swapping implementations without affecting business logic.

### 3. Entity vs Model Separation

**Entity (Domain)**:
- Pure business object
- No JSON, no framework dependencies
- Represents business concepts

**Model (Data)**:
- Framework-dependent (Freezed, JSON)
- Handles serialization
- Can be swapped without affecting domain

### 4. Repository Pattern

```
Presentation Layer
       │
       │ (uses)
       ▼
ProductRepository (interface)
       ▲
       │ (implements)
       │
ProductRepositoryImpl
       │
       │ (uses)
       ▼
Data Source (Mock/Real)
```

Benefits:
- Single source of truth
- Easy to test (mock repository)
- Easy to swap data sources
- Caching can be added here

### 5. Provider Architecture

```
@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<ProductEntity>> build() => _fetch();

  Future<void> refresh() => ...; // Pull-to-refresh
  Future<void> retry() => ...;   // Error retry
}
```

- Code generation (@riverpod)
- Type-safe
- Built-in loading/error states
- Easy to test

## 📁 File Organization

### Feature-First Structure

```
features/
└── products/
    ├── data/               ← Data Layer
    ├── domain/             ← Domain Layer
    └── presentation/       ← Presentation Layer
```

Benefits:
- Related code stays together
- Easy to add new features
- Clear boundaries
- Can extract to separate package if needed

### Layer Communication

```
presentation/providers/product_providers.dart
              │
              │ imports & uses
              ▼
domain/repositories/product_repository.dart (interface)
              ▲
              │ implements
              │
data/repositories/product_repository_impl.dart
              │
              │ uses
              ▼
data/datasources/mock_supabase_datasource.dart
```

## 🔄 Switching Data Sources

To replace MockSupabaseDataSource with real Supabase:

### Step 1: Create SupabaseDataSource

```dart
class SupabaseDataSource {
  final SupabaseClient _client;

  SupabaseDataSource(this._client);

  Future<List<Product>> getAllProducts() async {
    final response = await _client
        .from('products')
        .select()
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }
}
```

### Step 2: Update Repository

```dart
// Before
ProductRepositoryImpl({
  MockSupabaseDataSource? dataSource,
}) : _dataSource = dataSource ?? MockSupabaseDataSource();

// After
ProductRepositoryImpl({
  SupabaseDataSource? dataSource,
}) : _dataSource = dataSource ?? SupabaseDataSource(client);
```

### Step 3: Done!

✅ No changes needed in:
- Domain layer
- Presentation layer
- UI components
- Providers
- Navigation

This demonstrates the power of Clean Architecture and Dependency Inversion.

## 🧪 Testing Strategy

### Unit Tests (Domain & Data)

```
test/features/products/
├── data/
│   ├── models/product_test.dart              ✅ 7 tests
│   ├── datasources/mock_supabase_test.dart   ✅ 10 tests
│   └── repositories/repository_impl_test.dart ✅ 9 tests
```

### Widget Tests (Presentation)

```
test/widget_test.dart                          ✅ 1 test
```

### Integration Tests (E2E)

```
integration_test/ (ready for implementation)
```

## 🎓 Design Patterns Used

1. **Repository Pattern**: Abstracts data access
2. **Dependency Injection**: Via Riverpod providers
3. **Factory Pattern**: `Product.fromJson()`, `Product.fromEntity()`
4. **Observer Pattern**: Riverpod state management
5. **Strategy Pattern**: Swappable data sources
6. **Singleton**: Providers are singletons by default

## 📈 Scalability

This architecture scales to:
- ✅ Multiple features (users, orders, cart, etc.)
- ✅ Multiple data sources (REST, GraphQL, local DB)
- ✅ Multiple platforms (iOS, Android, Web)
- ✅ Team collaboration (clear boundaries)
- ✅ Testing at all layers
- ✅ Code reuse across features

---

**Key Takeaway**: Small app, production-grade architecture. Ready to scale from 2 screens to 200 screens without refactoring.

