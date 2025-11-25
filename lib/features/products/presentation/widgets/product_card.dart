import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drop_prototype/features/products/domain/entities/product_entity.dart';
import 'package:drop_prototype/core/theme/app_colors.dart';
import 'package:drop_prototype/core/theme/app_text_styles.dart';
import 'package:drop_prototype/core/constants/app_constants.dart';
import 'package:drop_prototype/core/router/app_router.dart';

/// Product Card Widget
///
/// Displays a product with image, title, category, and price
/// Optimized with:
/// - const constructor for performance
/// - CachedNetworkImage for efficient image loading
/// - Hero animation for smooth transition to detail screen
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: InkWell(
        onTap: () => context.goToProductDetail(product.id),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Hero animation
            _buildProductImage(),

            // Product Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Category Tag
                    _buildCategoryTag(),

                    const SizedBox(height: AppConstants.spacingS),

                    // Product Title
                    _buildProductTitle(),

                    const SizedBox(height: AppConstants.spacingS),

                    // Product Price
                    _buildProductPrice(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build product image with Hero animation and cached loading
  Widget _buildProductImage() {
    return Hero(
      tag: 'product-image-${product.id}',
      child: SizedBox(
        height: AppConstants.productCardImageHeight,
        width: double.infinity,
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
              size: 48,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  /// Build category tag
  Widget _buildCategoryTag() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingS,
        vertical: AppConstants.spacingXs,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: BorderRadius.circular(AppConstants.radiusS),
      ),
      child: Text(
        product.category.toUpperCase(),
        style: AppTextStyles.categoryTag,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// Build product title
  Widget _buildProductTitle() {
    return Text(
      product.title,
      style: AppTextStyles.productTitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Build product price
  Widget _buildProductPrice() {
    return Text(
      '\$${product.price.toStringAsFixed(2)}',
      style: AppTextStyles.price,
    );
  }
}
