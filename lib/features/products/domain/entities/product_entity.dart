/// Product entity - Pure business object without any framework dependencies
///
/// This is the domain layer representation of a Product.
/// It contains only business logic and no framework-specific code.
/// Following Clean Architecture principles: Domain layer is independent.
class ProductEntity {
  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final DateTime createdAt;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductEntity &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        category.hashCode ^
        createdAt.hashCode;
  }

  @override
  String toString() {
    return 'ProductEntity(id: $id, title: $title, price: $price, category: $category)';
  }
}
