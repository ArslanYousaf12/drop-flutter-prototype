import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:drop_prototype/features/products/presentation/screens/product_feed_screen.dart';
import 'package:drop_prototype/features/products/presentation/screens/product_detail_screen.dart';

/// Route names for type-safe navigation
class AppRoutes {
  AppRoutes._(); // Private constructor

  static const String productFeed = '/';
  static const String productDetail = '/product/:id';
}

/// GoRouter configuration with type-safe routes
/// Implements Material 3 page transitions
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.productFeed,
  debugLogDiagnostics: true,
  routes: [
    // Product Feed Screen (Home)
    GoRoute(
      path: AppRoutes.productFeed,
      name: 'productFeed',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ProductFeedScreen(),
      ),
    ),

    // Product Detail Screen
    GoRoute(
      path: AppRoutes.productDetail,
      name: 'productDetail',
      pageBuilder: (context, state) {
        final productId = state.pathParameters['id'];

        // Validate product ID
        if (productId == null || productId.isEmpty) {
          return MaterialPage(
            key: state.pageKey,
            child: Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: const Center(
                child: Text('Invalid product ID'),
              ),
            ),
          );
        }

        return MaterialPage(
          key: state.pageKey,
          child: ProductDetailScreen(productId: productId),
        );
      },
    ),
  ],

  // Error Page
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.uri.path}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.productFeed),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  ),
);

/// Extension on BuildContext for type-safe navigation
extension AppRouterExtension on BuildContext {
  /// Navigate to product detail screen
  void goToProductDetail(String productId) {
    go('/product/$productId');
  }

  /// Navigate to product feed screen
  void goToProductFeed() {
    go(AppRoutes.productFeed);
  }
}
