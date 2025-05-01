import 'package:evently/core/widgets/local_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryImageWidget extends StatelessWidget {
  final String? imagePath;
  const CategoryImageWidget({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: LocalCachedImage(
          height: 200.h,
          width: double.infinity,
          imagePath: imagePath ?? '',
        ),
      ),
    );
  }
}
