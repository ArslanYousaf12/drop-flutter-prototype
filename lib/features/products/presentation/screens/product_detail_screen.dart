import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drop_prototype/features/products/presentation/providers/product_providers.dart';
import 'package:drop_prototype/core/constants/app_constants.dart';
import 'package:drop_prototype/core/theme/app_colors.dart';
import 'package:drop_prototype/core/theme/app_text_styles.dart';

/// Product Detail Screen - Shows detailed product information
///
/// Features:
/// - Hero animation for image transition
/// - Scrollable content
/// - Category tag, title, description, price
/// - Error handling with retry
/// - AsyncValue state management via Riverpod
class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productDetailProvider(productId));

    return Scaffold(
      body: productAsync.when(
        // Loading State
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        // Error State
        error: (error, stackTrace) => _buildErrorState(context, ref, error),

        // Success State
        data: (product) => CustomScrollView(
          slivers: [
            // App Bar with Hero Image
            SliverAppBar(
              expandedHeight: AppConstants.productDetailImageHeight,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'product-image-$productId',
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.surfaceVariant,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.surfaceVariant,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        size: 64,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Product Details
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category Tag
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.spacingM,
                        vertical: AppConstants.spacingS,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryContainer,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusM),
                      ),
                      child: Text(
                        product.category.toUpperCase(),
                        style: AppTextStyles.categoryTag.copyWith(
                          fontSize: 13,
                        ),
                      ),
                    ),

                    const SizedBox(height: AppConstants.spacingL),

                    // Product Title
                    Text(
                      product.title,
                      style: AppTextStyles.h3,
                    ),

                    const SizedBox(height: AppConstants.spacingM),

                    // Product Price
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: AppConstants.spacingL),

                    // Description Header
                    Text(
                      'Description',
                      style: AppTextStyles.h5,
                    ),

                    const SizedBox(height: AppConstants.spacingM),

                    // Product Description
                    Text(
                      product.description,
                      style: AppTextStyles.bodyLarge.copyWith(
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: AppConstants.spacingXl),

                    // Product Info Cards
                    _buildInfoCards(product),

                    const SizedBox(height: AppConstants.spacingXxl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build error state with retry
  Widget _buildErrorState(BuildContext context, WidgetRef ref, Object error) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Center(
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
                  // Invalidate the provider to trigger a reload
                  ref.invalidate(productDetailProvider(productId));
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build product info cards
  Widget _buildInfoCards(product) {
    return Row(
      children: [
        Expanded(
          child: _buildInfoCard(
            icon: Icons.calendar_today_outlined,
            label: 'Added',
            value: _formatDate(product.createdAt),
          ),
        ),
        const SizedBox(width: AppConstants.spacingM),
        Expanded(
          child: _buildInfoCard(
            icon: Icons.category_outlined,
            label: 'Category',
            value: product.category,
          ),
        ),
      ],
    );
  }

  /// Build single info card
  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacingM),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
        border: Border.all(
          color: AppColors.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 28,
          ),
          const SizedBox(height: AppConstants.spacingS),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.labelMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  /// Format date for display
  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
