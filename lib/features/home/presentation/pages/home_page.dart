// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/containers/primary_container.dart';
import '../../../../core/utils/app_spacing.dart';
import '../../../../injector.dart';
import '../blocs/home_cubit.dart';
import '../blocs/home_state.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => getIt<HomeCubit>()..loadCategories(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeError) {
            return Center(child: Text('Error: {state.message}'));
          }

          if (state is HomeLoaded) {
            return PrimaryContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'What service are you looking for today?',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(category: state.categories[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(child: Text('Welcome to Home'));
        },
      ),
    );
  }
}
