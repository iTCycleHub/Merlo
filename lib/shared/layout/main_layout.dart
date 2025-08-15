// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_styles.dart';
import '../widgets/custom_drawer.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: isDarkMode(context) ? AppColors.kDark : AppColors.kBackground,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: isDarkMode(context) ? AppColors.kDark : AppColors.kBackground,
        elevation: 0,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: SvgPicture.asset(
            AppAssets.kMenu,
            height: 20.h,
            width: 20.w,
            colorFilter: ColorFilter.mode(
              isDarkMode(context) ? AppColors.kWhite : AppColors.kBlack,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          'Door Hub',
          style: AppTextStyles.kBold18.copyWith(
            color: isDarkMode(context) ? AppColors.kWhite : AppColors.kBlack,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to notifications
            },
            icon: SvgPicture.asset(
              AppAssets.kNotification,
              height: 20.h,
              width: 20.w,
              colorFilter: ColorFilter.mode(
                isDarkMode(context) ? AppColors.kWhite : AppColors.kBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDarkMode(context) ? AppColors.kDarkInput : AppColors.kWhite,
          boxShadow: [
            BoxShadow(
              color: isDarkMode(context)
                  ? Colors.transparent
                  : AppColors.kBlack.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _navigateToTab(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.kSecondary,
          unselectedItemColor: AppColors.kHint,
          elevation: 0,
          selectedLabelStyle: AppTextStyles.kMedium12.copyWith(
            color: AppColors.kSecondary,
          ),
          unselectedLabelStyle: AppTextStyles.kMedium12.copyWith(
            color: AppColors.kHint,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(
                  _currentIndex == 0 ? AppAssets.kActiveHome : AppAssets.kHome,
                  height: 22.h,
                  width: 22.w,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 0 ? AppColors.kSecondary : AppColors.kHint,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(
                  _currentIndex == 1 ? AppAssets.kActiveOrder : AppAssets.kOrder,
                  height: 22.h,
                  width: 22.w,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 1 ? AppColors.kSecondary : AppColors.kHint,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(
                  AppAssets.kNotification,
                  height: 22.h,
                  width: 22.w,
                  colorFilter: ColorFilter.mode(
                    _currentIndex == 2 ? AppColors.kSecondary : AppColors.kHint,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8.r),
                child: Image.asset(
                  AppAssets.kLiveChat,
                  height: 22.h,
                  width: 22.w,
                  color: _currentIndex == 3 ? AppColors.kSecondary : AppColors.kHint,
                ),
              ),
              label: 'Chat',
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }

  void _navigateToTab(int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        // Navigate to orders page - will implement later
        break;
      case 2:
        // Navigate to notifications page - will implement later
        break;
      case 3:
        // Navigate to chat page - will implement later
        break;
    }
  }
}
