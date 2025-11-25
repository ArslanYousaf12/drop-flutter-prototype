import 'package:flutter_test/flutter_test.dart';
import 'package:drop_prototype/features/products/data/repositories/product_repository_impl.dart';
import 'package:drop_prototype/features/products/domain/entities/product_entity.dart';

void main() {
  late ProductRepositoryImpl repository;

  setUp(() {
    repository = ProductRepositoryImpl();
  });

  group('ProductRepositoryImpl Tests', () {
    test('getAllProducts should return list of ProductEntity', () async {
      // Act
      final products = await repository.getAllProducts();

      // Assert
      expect(products, isA<List<ProductEntity>>());
      expect(products.length, 15);
    });

    test('getAllProducts should return entities not models', () async {
      // Act
      final products = await repository.getAllProducts();

      // Assert
      for (final product in products) {
        expect(product, isA<ProductEntity>());
        expect(product.id, isNotEmpty);
        expect(product.title, isNotEmpty);
        expect(product.description, isNotEmpty);
        expect(product.price, greaterThan(0));
      }
    });

    test('getProductById should return correct ProductEntity', () async {
      // Act
      final product = await repository.getProductById('1');

      // Assert
      expect(product, isA<ProductEntity>());
      expect(product.id, '1');
      expect(product.title, 'Wireless Headphones Pro');
    });

    test('getProductById should throw exception for invalid id', () async {
      // Assert
      expect(
        () => repository.getProductById('999'),
        throwsA(isA<Exception>()),
      );
    });

    test('getProductsByCategory should return filtered entities', () async {
      // Act
      final products = await repository.getProductsByCategory('Electronics');

      // Assert
      expect(products, isA<List<ProductEntity>>());
      expect(products.length, greaterThan(0));

      for (final product in products) {
        expect(product, isA<ProductEntity>());
        expect(product.category, 'Electronics');
      }
    });

    test('getProductsByCategory should throw exception for invalid category', () async {
      // Assert
      expect(
        () => repository.getProductsByCategory('InvalidCategory'),
        throwsA(isA<Exception>()),
      );
    });

    test('should properly convert data models to domain entities', () async {
      // Act
      final product = await repository.getProductById('5');

      // Assert - verify entity has all required fields from model
      expect(product.id, '5');
      expect(product.title, 'Classic Leather Jacket');
      expect(product.category, 'Fashion');
      expect(product.price, 349.99);
      expect(product.imageUrl, isNotEmpty);
      expect(product.description, isNotEmpty);
      expect(product.createdAt, isNotNull);
    });

    test('repository should maintain data source independence', () async {
      // This test verifies repository pattern - repository returns domain entities
      // Act
      final products = await repository.getAllProducts();

      // Assert - all results should be domain entities, not data models
      for (final product in products) {
        expect(product.runtimeType.toString(), 'ProductEntity');
      }
    });

    test('error messages should include context', () async {
      // Act & Assert
      try {
        await repository.getProductById('invalid');
        fail('Should have thrown an exception');
      } catch (e) {
        expect(e.toString(), contains('Failed to fetch product'));
        expect(e.toString(), contains('invalid'));
      }
    });
  });
}
