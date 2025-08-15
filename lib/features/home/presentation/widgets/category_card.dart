// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_typography.dart';
import '../../domain/entities/category.dart';
import '../../data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Si es CategoryModel, usar su color, sino usar un color por defecto
    Color cardColor = AppColors.kPrimary.withOpacity(0.1);
    if (category is CategoryModel) {
      cardColor = (category as CategoryModel).color;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              category.icon,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                AppColors.kPrimary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              category.name,
              style: AppTypography.kLight12.copyWith(
                color: AppColors.kNeutral04,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
