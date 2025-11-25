import 'package:flutter_test/flutter_test.dart';
import 'package:drop_prototype/features/products/data/models/product.dart';
import 'package:drop_prototype/features/products/domain/entities/product_entity.dart';

void main() {
  group('Product Model Tests', () {
    final testJson = {
      'id': '1',
      'title': 'Test Product',
      'description': 'Test Description',
      'price': 99.99,
      'image_url': 'https://example.com/image.jpg',
      'category': 'Electronics',
      'created_at': '2024-01-15T10:00:00Z',
    };

    final testProduct = Product(
      id: '1',
      title: 'Test Product',
      description: 'Test Description',
      price: 99.99,
      imageUrl: 'https://example.com/image.jpg',
      category: 'Electronics',
      createdAt: DateTime.parse('2024-01-15T10:00:00Z'),
    );

    test('should create Product from JSON with correct field mapping', () {
      // Act
      final result = Product.fromJson(testJson);

      // Assert
      expect(result.id, '1');
      expect(result.title, 'Test Product');
      expect(result.description, 'Test Description');
      expect(result.price, 99.99);
      expect(result.imageUrl, 'https://example.com/image.jpg');
      expect(result.category, 'Electronics');
      expect(result.createdAt, DateTime.parse('2024-01-15T10:00:00Z'));
    });

    test('should serialize Product to JSON with snake_case keys', () {
      // Act
      final json = testProduct.toJson();

      // Assert
      expect(json['id'], '1');
      expect(json['title'], 'Test Product');
      expect(json['description'], 'Test Description');
      expect(json['price'], 99.99);
      expect(json['image_url'], 'https://example.com/image.jpg');
      expect(json['category'], 'Electronics');
      expect(json['created_at'], '2024-01-15T10:00:00.000Z');
    });

    test('should convert Product to ProductEntity correctly', () {
      // Act
      final entity = testProduct.toEntity();

      // Assert
      expect(entity, isA<ProductEntity>());
      expect(entity.id, testProduct.id);
      expect(entity.title, testProduct.title);
      expect(entity.description, testProduct.description);
      expect(entity.price, testProduct.price);
      expect(entity.imageUrl, testProduct.imageUrl);
      expect(entity.category, testProduct.category);
      expect(entity.createdAt, testProduct.createdAt);
    });

    test('should create Product from ProductEntity', () {
      // Arrange
      final entity = ProductEntity(
        id: '1',
        title: 'Test Product',
        description: 'Test Description',
        price: 99.99,
        imageUrl: 'https://example.com/image.jpg',
        category: 'Electronics',
        createdAt: DateTime.parse('2024-01-15T10:00:00Z'),
      );

      // Act
      final product = Product.fromEntity(entity);

      // Assert
      expect(product.id, entity.id);
      expect(product.title, entity.title);
      expect(product.description, entity.description);
      expect(product.price, entity.price);
      expect(product.imageUrl, entity.imageUrl);
      expect(product.category, entity.category);
      expect(product.createdAt, entity.createdAt);
    });

    test('should support equality comparison', () {
      // Arrange
      final product1 = Product.fromJson(testJson);
      final product2 = Product.fromJson(testJson);

      // Assert
      expect(product1, equals(product2));
    });

    test('should support copyWith functionality', () {
      // Act
      final updated = testProduct.copyWith(
        title: 'Updated Title',
        price: 149.99,
      );

      // Assert
      expect(updated.title, 'Updated Title');
      expect(updated.price, 149.99);
      expect(updated.id, testProduct.id);
      expect(updated.description, testProduct.description);
    });
  });
}
