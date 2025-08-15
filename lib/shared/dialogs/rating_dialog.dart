// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_typography.dart';

class RatingDialog extends StatelessWidget {
  final Animation<double> opacity;
  final Animation<double> scale;
  
  const RatingDialog({
    super.key, 
    required this.opacity, 
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Transform.scale(
      scale: scale.value,
      child: Opacity(
        opacity: opacity.value,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.kLogo),
              SizedBox(height: 16.h),
              Text('Califica iTServicePro', style: AppTypography.kBold20),
              SizedBox(height: 10.h),
              Text(
                'Tu opinión nos ayuda a mejorar la experiencia para todos',
                style: AppTypography.kLight14,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.h),
              // Rating field - simplified for now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) =>
                  Icon(
                    Icons.star_border,
                    color: AppColors.kSecondary,
                    size: 30.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        backgroundColor: isDarkMode(context)
                            ? AppColors.kContentColor
                            : AppColors.kWhite,
                        side: BorderSide(color: AppColors.kSecondary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'No, Thanks',
                        style: AppTypography.kMedium14.copyWith(
                          color: AppColors.kSecondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kSecondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Rate on Play Store',
                        style: AppTypography.kMedium14.copyWith(
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
