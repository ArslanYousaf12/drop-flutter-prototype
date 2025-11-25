import 'package:drop_prototype/features/products/data/datasources/mock_supabase_datasource.dart';
import 'package:drop_prototype/features/products/domain/entities/product_entity.dart';
import 'package:drop_prototype/features/products/domain/repositories/product_repository.dart';

/// Implementation of ProductRepository
///
/// This is the concrete implementation of the abstract repository interface.
/// Following Clean Architecture principles:
/// - Data layer implements the interface defined in domain layer
/// - Depends on abstraction (ProductRepository), not concrete implementations
/// - Easy to swap data sources without affecting business logic
///
/// Current implementation uses MockSupabaseDataSource.
/// To switch to real Supabase:
/// 1. Replace MockSupabaseDataSource with SupabaseDataSource
/// 2. Inject via constructor (dependency injection)
/// 3. No changes needed in domain layer or presentation layer!
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({
    MockSupabaseDataSource? dataSource,
  }) : _dataSource = dataSource ?? MockSupabaseDataSource();

  final MockSupabaseDataSource _dataSource;

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    try {
      // Fetch from data source
      final products = await _dataSource.getAllProducts();

      // Convert data models to domain entities
      // This separation keeps domain layer independent
      return products.map((product) => product.toEntity()).toList();
    } catch (e) {
      // In production, you might want to:
      // - Log errors to analytics service
      // - Return custom failure types instead of throwing
      // - Handle specific error types differently
      throw Exception('Failed to fetch products: $e');
    }
  }

  @override
  Future<ProductEntity> getProductById(String id) async {
    try {
      final product = await _dataSource.getProductById(id);
      return product.toEntity();
    } catch (e) {
      throw Exception('Failed to fetch product with ID $id: $e');
    }
  }

  @override
  Future<List<ProductEntity>> getProductsByCategory(String category) async {
    try {
      final products = await _dataSource.getProductsByCategory(category);
      return products.map((product) => product.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to fetch products for category $category: $e');
    }
  }
}
