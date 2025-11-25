// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'fee14d549a8ea3bf1501401123170dba730c94eb';

/// Provider for ProductRepository
///
/// This provider creates and manages the repository instance.
/// Using dependency injection pattern - easy to swap implementations for testing.
///
/// Copied from [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
      productRepository,
      name: r'productRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$productRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productDetailHash() => r'f806c24f814541f5a51e13643a8881d2475ca029';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for fetching a single product by ID
///
/// This is a family provider - takes productId as parameter
/// Riverpod automatically caches results per productId
///
/// Copied from [productDetail].
@ProviderFor(productDetail)
const productDetailProvider = ProductDetailFamily();

/// Provider for fetching a single product by ID
///
/// This is a family provider - takes productId as parameter
/// Riverpod automatically caches results per productId
///
/// Copied from [productDetail].
class ProductDetailFamily extends Family<AsyncValue<ProductEntity>> {
  /// Provider for fetching a single product by ID
  ///
  /// This is a family provider - takes productId as parameter
  /// Riverpod automatically caches results per productId
  ///
  /// Copied from [productDetail].
  const ProductDetailFamily();

  /// Provider for fetching a single product by ID
  ///
  /// This is a family provider - takes productId as parameter
  /// Riverpod automatically caches results per productId
  ///
  /// Copied from [productDetail].
  ProductDetailProvider call(String productId) {
    return ProductDetailProvider(productId);
  }

  @override
  ProductDetailProvider getProviderOverride(
    covariant ProductDetailProvider provider,
  ) {
    return call(provider.productId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productDetailProvider';
}

/// Provider for fetching a single product by ID
///
/// This is a family provider - takes productId as parameter
/// Riverpod automatically caches results per productId
///
/// Copied from [productDetail].
class ProductDetailProvider extends AutoDisposeFutureProvider<ProductEntity> {
  /// Provider for fetching a single product by ID
  ///
  /// This is a family provider - takes productId as parameter
  /// Riverpod automatically caches results per productId
  ///
  /// Copied from [productDetail].
  ProductDetailProvider(String productId)
    : this._internal(
        (ref) => productDetail(ref as ProductDetailRef, productId),
        from: productDetailProvider,
        name: r'productDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$productDetailHash,
        dependencies: ProductDetailFamily._dependencies,
        allTransitiveDependencies:
            ProductDetailFamily._allTransitiveDependencies,
        productId: productId,
      );

  ProductDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    FutureOr<ProductEntity> Function(ProductDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailProvider._internal(
        (ref) => create(ref as ProductDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProductEntity> createElement() {
    return _ProductDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductDetailRef on AutoDisposeFutureProviderRef<ProductEntity> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _ProductDetailProviderElement
    extends AutoDisposeFutureProviderElement<ProductEntity>
    with ProductDetailRef {
  _ProductDetailProviderElement(super.provider);

  @override
  String get productId => (origin as ProductDetailProvider).productId;
}

String _$productsByCategoryHash() =>
    r'260ddbcc8b7be1add38823725096a1c5b7c93654';

/// Provider for fetching products by category
///
/// Another family provider - filtered by category
/// Useful for implementing category filters in the UI
///
/// Copied from [productsByCategory].
@ProviderFor(productsByCategory)
const productsByCategoryProvider = ProductsByCategoryFamily();

/// Provider for fetching products by category
///
/// Another family provider - filtered by category
/// Useful for implementing category filters in the UI
///
/// Copied from [productsByCategory].
class ProductsByCategoryFamily extends Family<AsyncValue<List<ProductEntity>>> {
  /// Provider for fetching products by category
  ///
  /// Another family provider - filtered by category
  /// Useful for implementing category filters in the UI
  ///
  /// Copied from [productsByCategory].
  const ProductsByCategoryFamily();

  /// Provider for fetching products by category
  ///
  /// Another family provider - filtered by category
  /// Useful for implementing category filters in the UI
  ///
  /// Copied from [productsByCategory].
  ProductsByCategoryProvider call(String category) {
    return ProductsByCategoryProvider(category);
  }

  @override
  ProductsByCategoryProvider getProviderOverride(
    covariant ProductsByCategoryProvider provider,
  ) {
    return call(provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productsByCategoryProvider';
}

/// Provider for fetching products by category
///
/// Another family provider - filtered by category
/// Useful for implementing category filters in the UI
///
/// Copied from [productsByCategory].
class ProductsByCategoryProvider
    extends AutoDisposeFutureProvider<List<ProductEntity>> {
  /// Provider for fetching products by category
  ///
  /// Another family provider - filtered by category
  /// Useful for implementing category filters in the UI
  ///
  /// Copied from [productsByCategory].
  ProductsByCategoryProvider(String category)
    : this._internal(
        (ref) => productsByCategory(ref as ProductsByCategoryRef, category),
        from: productsByCategoryProvider,
        name: r'productsByCategoryProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$productsByCategoryHash,
        dependencies: ProductsByCategoryFamily._dependencies,
        allTransitiveDependencies:
            ProductsByCategoryFamily._allTransitiveDependencies,
        category: category,
      );

  ProductsByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<ProductEntity>> Function(ProductsByCategoryRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductsByCategoryProvider._internal(
        (ref) => create(ref as ProductsByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductEntity>> createElement() {
    return _ProductsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductsByCategoryProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductsByCategoryRef
    on AutoDisposeFutureProviderRef<List<ProductEntity>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _ProductsByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductEntity>>
    with ProductsByCategoryRef {
  _ProductsByCategoryProviderElement(super.provider);

  @override
  String get category => (origin as ProductsByCategoryProvider).category;
}

String _$productListHash() => r'8b539cec09c823b0c3c0a0d3c8c443b4bc581671';

/// Provider for fetching all products
///
/// AsyncNotifier provides:
/// - Loading state management
/// - Error handling
/// - Automatic rebuild on state changes
/// - Pull-to-refresh capability
///
/// The @riverpod annotation generates:
/// - Provider definition
/// - State management boilerplate
/// - Type-safe access
///
/// Copied from [ProductList].
@ProviderFor(ProductList)
final productListProvider =
    AutoDisposeAsyncNotifierProvider<ProductList, List<ProductEntity>>.internal(
      ProductList.new,
      name: r'productListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$productListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProductList = AutoDisposeAsyncNotifier<List<ProductEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
