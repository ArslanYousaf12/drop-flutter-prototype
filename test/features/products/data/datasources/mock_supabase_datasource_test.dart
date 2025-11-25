import 'package:flutter_test/flutter_test.dart';
import 'package:drop_prototype/features/products/data/datasources/mock_supabase_datasource.dart';
import 'package:drop_prototype/features/products/data/models/product.dart';

void main() {
  late MockSupabaseDataSource dataSource;

  setUp(() {
    dataSource = MockSupabaseDataSource();
  });

  group('MockSupabaseDataSource Tests', () {
    test('getAllProducts should return list of products', () async {
      // Act
      final products = await dataSource.getAllProducts();

      // Assert
      expect(products, isA<List<Product>>());
      expect(products.length, greaterThan(0));
      expect(products.length, 15); // We have 15 mock products
    });

    test('getAllProducts should return products sorted by newest first', () async {
      // Act
      final products = await dataSource.getAllProducts();

      // Assert
      for (int i = 0; i < products.length - 1; i++) {
        expect(
          products[i].createdAt.isAfter(products[i + 1].createdAt) ||
              products[i].createdAt.isAtSameMomentAs(products[i + 1].createdAt),
          true,
          reason: 'Products should be sorted by createdAt descending',
        );
      }
    });

    test('getProductById should return correct product', () async {
      // Act
      final product = await dataSource.getProductById('1');

      // Assert
      expect(product, isA<Product>());
      expect(product.id, '1');
      expect(product.title, 'Wireless Headphones Pro');
      expect(product.category, 'Electronics');
    });

    test('getProductById should throw exception for invalid id', () async {
      // Assert
      expect(
        () => dataSource.getProductById('invalid-id'),
        throwsA(isA<Exception>()),
      );
    });

    test('getProductsByCategory should return filtered products', () async {
      // Act
      final products = await dataSource.getProductsByCategory('Electronics');

      // Assert
      expect(products, isA<List<Product>>());
      expect(products.length, greaterThan(0));

      // All products should be in Electronics category
      for (final product in products) {
        expect(product.category, 'Electronics');
      }
    });

    test('getProductsByCategory should return products sorted by newest', () async {
      // Act
      final products = await dataSource.getProductsByCategory('Fashion');

      // Assert
      expect(products.length, greaterThan(0));

      for (int i = 0; i < products.length - 1; i++) {
        expect(
          products[i].createdAt.isAfter(products[i + 1].createdAt) ||
              products[i].createdAt.isAtSameMomentAs(products[i + 1].createdAt),
          true,
        );
      }
    });

    test('getProductsByCategory should throw exception for invalid category', () async {
      // Assert
      expect(
        () => dataSource.getProductsByCategory('InvalidCategory'),
        throwsA(isA<Exception>()),
      );
    });

    test('should have products in all 4 categories', () async {
      // Act
      final allProducts = await dataSource.getAllProducts();
      final categories = allProducts.map((p) => p.category).toSet();

      // Assert
      expect(categories.length, 4);
      expect(categories, contains('Electronics'));
      expect(categories, contains('Fashion'));
      expect(categories, contains('Home'));
      expect(categories, contains('Sports'));
    });

    test('all products should have valid data', () async {
      // Act
      final products = await dataSource.getAllProducts();

      // Assert
      for (final product in products) {
        expect(product.id, isNotEmpty);
        expect(product.title, isNotEmpty);
        expect(product.description, isNotEmpty);
        expect(product.price, greaterThan(0));
        expect(product.imageUrl, isNotEmpty);
        expect(product.imageUrl, startsWith('https://'));
        expect(product.category, isNotEmpty);
        expect(product.createdAt, isNotNull);
      }
    });

    test('should simulate network delay', () async {
      // Arrange
      final stopwatch = Stopwatch()..start();

      // Act
      await dataSource.getAllProducts();
      stopwatch.stop();

      // Assert - should take at least 400ms (500ms delay minus test overhead)
      expect(stopwatch.elapsedMilliseconds, greaterThan(400));
    });
  });
}
