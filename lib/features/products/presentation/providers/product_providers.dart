import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drop_prototype/features/products/data/repositories/product_repository_impl.dart';
import 'package:drop_prototype/features/products/domain/entities/product_entity.dart';
import 'package:drop_prototype/features/products/domain/repositories/product_repository.dart';

// Required for Riverpod code generation
part 'product_providers.g.dart';

/// Provider for ProductRepository
///
/// This provider creates and manages the repository instance.
/// Using dependency injection pattern - easy to swap implementations for testing.
@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl();
}

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
@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<ProductEntity>> build() async {
    // Initial load
    return _fetchProducts();
  }

  /// Fetch products from repository
  Future<List<ProductEntity>> _fetchProducts() async {
    final repository = ref.read(productRepositoryProvider);
    return await repository.getAllProducts();
  }

  /// Refresh products (pull-to-refresh)
  Future<void> refresh() async {
    // Set loading state
    state = const AsyncValue.loading();

    // Fetch new data
    state = await AsyncValue.guard(() => _fetchProducts());
  }

  /// Retry after error
  Future<void> retry() async {
    await refresh();
  }
}

/// Provider for fetching a single product by ID
///
/// This is a family provider - takes productId as parameter
/// Riverpod automatically caches results per productId
@riverpod
Future<ProductEntity> productDetail(
  ProductDetailRef ref,
  String productId,
) async {
  final repository = ref.read(productRepositoryProvider);
  return await repository.getProductById(productId);
}

/// Provider for fetching products by category
///
/// Another family provider - filtered by category
/// Useful for implementing category filters in the UI
@riverpod
Future<List<ProductEntity>> productsByCategory(
  ProductsByCategoryRef ref,
  String category,
) async {
  final repository = ref.read(productRepositoryProvider);
  return await repository.getProductsByCategory(category);
}
