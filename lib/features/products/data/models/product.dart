import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:drop_prototype/features/products/domain/entities/product_entity.dart';

// Required for Freezed code generation
part 'product.freezed.dart';
part 'product.g.dart';

/// Product model - Data layer representation with JSON serialization
///
/// Using Freezed for:
/// - Immutability (all fields are final)
/// - Equality comparison (== operator)
/// - Copy with method
/// - toString, hashCode implementations
///
/// Using JSON Serializable for:
/// - Automatic JSON encoding/decoding
/// - Type-safe serialization
///
/// This model matches Supabase JSON structure for easy migration.
@freezed
class Product with _$Product {
  const Product._(); // Private constructor for custom methods

  const factory Product({
    required String id,
    required String title,
    required String description,
    required double price,
    @JsonKey(name: 'image_url') required String imageUrl,
    required String category,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Product;

  /// Create Product from JSON (Supabase format)
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Convert to domain entity
  ///
  /// This method transforms the data model into a domain entity.
  /// Separating data models from domain entities allows:
  /// - Domain layer to be independent of data source format
  /// - Easy migration between different data sources
  /// - Business logic to work with clean domain objects
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      price: price,
      imageUrl: imageUrl,
      category: category,
      createdAt: createdAt,
    );
  }

  /// Create Product from domain entity
  factory Product.fromEntity(ProductEntity entity) {
    return Product(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl,
      category: entity.category,
      createdAt: entity.createdAt,
    );
  }
}
