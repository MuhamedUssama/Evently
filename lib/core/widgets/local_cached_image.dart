import 'package:evently/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LocalCachedImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final Widget? errorWidget;

  const LocalCachedImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: width,
      height: height,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame == null) {
          return Shimmer.fromColors(
            baseColor: AppTheme.grey.withValues(alpha: 0.5),
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: width,
              height: height,
              color: AppTheme.grey.withValues(alpha: 0.5),
            ),
          );
        }
        return child;
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Container(
              width: width,
              height: height,
              color: Colors.grey[300],
              child: const Icon(Icons.error, color: Colors.red),
            );
      },
    );
  }
}
