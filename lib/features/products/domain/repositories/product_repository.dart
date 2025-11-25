import 'package:drop_prototype/features/products/domain/entities/product_entity.dart';

/// Abstract repository interface for Product operations
///
/// This defines the contract that any data source implementation must follow.
/// Following Clean Architecture: Domain layer defines the interface,
/// Data layer provides the implementation (Dependency Inversion Principle).
///
/// This allows us to:
/// - Easily swap data sources (mock → Supabase → REST API)
/// - Test business logic without actual data sources
/// - Keep domain layer independent of implementation details
abstract class ProductRepository {
  /// Fetch all products
  ///
  /// Returns a list of [ProductEntity] or throws an exception on failure
  Future<List<ProductEntity>> getAllProducts();

  /// Fetch a single product by ID
  ///
  /// Returns a [ProductEntity] or throws an exception if not found
  Future<ProductEntity> getProductById(String id);

  /// Fetch products by category
  ///
  /// Returns a list of [ProductEntity] or throws an exception on failure
  Future<List<ProductEntity>> getProductsByCategory(String category);
}
