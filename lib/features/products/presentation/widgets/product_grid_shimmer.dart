import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:drop_prototype/core/theme/app_colors.dart';
import 'package:drop_prototype/core/constants/app_constants.dart';

/// Shimmer Loading Widget for Product Grid
///
/// Displays a loading skeleton that mimics the actual product grid layout
/// Provides better UX than a simple CircularProgressIndicator
class ProductGridShimmer extends StatelessWidget {
  const ProductGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppConstants.spacingM),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppConstants.gridCrossAxisCount,
        crossAxisSpacing: AppConstants.gridCrossAxisSpacing,
        mainAxisSpacing: AppConstants.gridMainAxisSpacing,
        childAspectRatio: AppConstants.gridChildAspectRatio,
      ),
      itemCount: 6, // Show 6 skeleton cards
      itemBuilder: (context, index) => const _ShimmerProductCard(),
    );
  }
}

/// Single shimmer product card
class _ShimmerProductCard extends StatelessWidget {
  const _ShimmerProductCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.radiusM),
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBase,
        highlightColor: AppColors.shimmerHighlight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: AppConstants.productCardImageHeight,
              width: double.infinity,
              color: Colors.white,
            ),

            // Details placeholder
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppConstants.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Category tag placeholder
                    Container(
                      width: 80,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusS),
                      ),
                    ),

                    const SizedBox(height: AppConstants.spacingS),

                    // Title placeholder (2 lines)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 120,
                          height: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    const SizedBox(height: AppConstants.spacingS),

                    // Price placeholder
                    Container(
                      width: 70,
                      height: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
