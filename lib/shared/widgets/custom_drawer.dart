// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_spacing.dart';
import '../../theme_controller.dart';
import '../dialogs/rating_dialog.dart';
import 'profile_image_card.dart';
import 'side_menu.dart';
import 'toggle_button.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor:
          isDarkMode(context) ? AppColors.kDarkInput : AppColors.kPrimary,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              ProfileImageCard(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 100)).then((_) {
                    Navigator.pop(context);
                    // Navigate to profile - Clean Architecture navigation
                  });
                },
              ),
              SizedBox(height: 50.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 0;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    Navigator.pop(context);
                    // Navigate to Calendar
                  });
                },
                icon: AppAssets.kCalendar,
                isSelected: selectedMenu == 0,
                text: 'Calendar',
              ),
              SizedBox(height: 10.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 1;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    Navigator.pop(context);
                    // Navigate to Payment Methods
                  });
                },
                icon: AppAssets.kPaymentMethod,
                isSelected: selectedMenu == 1,
                text: 'Payment Methods',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 2;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    Navigator.pop(context);
                    // Navigate to Address
                  });
                },
                icon: AppAssets.kAddress,
                isSelected: selectedMenu == 2,
                text: 'Address',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 3;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    Navigator.pop(context);
                    // Navigate to Notifications
                  });
                },
                icon: AppAssets.kNotification,
                isSelected: selectedMenu == 3,
                text: 'Notifications',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 4;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    Navigator.pop(context);
                    // Navigate to Offers
                  });
                },
                icon: AppAssets.kOffers,
                isSelected: selectedMenu == 4,
                text: 'Offers',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 5;
                  });
                  Future.delayed(const Duration(milliseconds: 500)).then((_) {
                    Navigator.pop(context);
                    // Navigate to Refer Friend
                  });
                },
                icon: AppAssets.kFriends,
                isSelected: selectedMenu == 5,
                text: 'Refer a Friend',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 6;
                  });
                },
                icon: AppAssets.kSupport,
                isSelected: selectedMenu == 6,
                text: 'Support',
              ),
              SizedBox(height: 5.h),
              SideMenu(
                onPressed: () {
                  setState(() {
                    selectedMenu = 7;
                  });
                  showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return RatingDialog(
                        opacity: a1,
                        scale: a1,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 200),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context,
                    pageBuilder: (context, animation1, animation2) {
                      return const SizedBox();
                    },
                  );
                },
                icon: AppAssets.kStar,
                isSelected: selectedMenu == 7,
                text: 'Rate Us',
              ),
              const Spacer(),
              const Divider(color: AppColors.kHint),
              SideMenu(
                isSelected: false,
                icon: AppAssets.kHelp,
                text: 'Color Scheme',
              ),
              ListenableBuilder(
                listenable: globalThemeController,
                builder: (context, child) {
                  return ToggleButton(
                    onDarkModeSelected: () {
                      globalThemeController.setTheme(ThemeOptions.dark);
                    },
                    onLightModeSelected: () {
                      globalThemeController.setTheme(ThemeOptions.light);
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
