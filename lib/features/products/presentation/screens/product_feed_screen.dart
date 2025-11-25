import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drop_prototype/features/products/presentation/providers/product_providers.dart';
import 'package:drop_prototype/features/products/presentation/widgets/product_card.dart';
import 'package:drop_prototype/features/products/presentation/widgets/product_grid_shimmer.dart';
import 'package:drop_prototype/core/constants/app_constants.dart';
import 'package:drop_prototype/core/theme/app_colors.dart';

/// Product Feed Screen - Main screen showing grid of products
///
/// Features:
/// - Grid layout with 2 columns
/// - Pull-to-refresh functionality
/// - Shimmer loading state
/// - Error handling with retry
/// - AsyncValue state management via Riverpod
class ProductFeedScreen extends ConsumerWidget {
  const ProductFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: false,
      ),
      body: productsAsync.when(
        // Loading State - Show shimmer
        loading: () => const ProductGridShimmer(),

        // Error State - Show error message with retry
        error: (error, stackTrace) => _buildErrorState(context, ref, error),

        // Success State - Show product grid
        data: (products) => _buildProductGrid(context, ref, products),
      ),
    );
  }

  /// Build product grid with pull-to-refresh
  Widget _buildProductGrid(BuildContext context, WidgetRef ref, List products) {
    if (products.isEmpty) {
      return _buildEmptyState(context);
    }

    return RefreshIndicator(
      onRefresh: () async {
        // Trigger refresh
        await ref.read(productListProvider.notifier).refresh();
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(AppConstants.spacingM),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AppConstants.gridCrossAxisCount,
          crossAxisSpacing: AppConstants.gridCrossAxisSpacing,
          mainAxisSpacing: AppConstants.gridMainAxisSpacing,
          childAspectRatio: AppConstants.gridChildAspectRatio,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }

  /// Build error state with retry button
  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppConstants.spacingM),
            const Text(
              'Oops! Something went wrong',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.spacingS),
            Text(
              error.toString(),
              style: TextStyle(
                fontSize: 14,
                color: AppColors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppConstants.spacingL),
            ElevatedButton.icon(
              onPressed: () {
                // Trigger retry
                ref.read(productListProvider.notifier).retry();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  /// Build empty state
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inventory_2_outlined,
              size: 64,
              color: AppColors.onSurfaceVariant,
            ),
            const SizedBox(height: AppConstants.spacingM),
            const Text(
              'No products available',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppConstants.spacingS),
            Text(
              'Check back later for new products',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
