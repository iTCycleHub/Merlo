// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle  
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/containers/primary_container.dart';
import '../../../../injector.dart';
import '../blocs/home_cubit.dart';
import '../blocs/home_state.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  
  const HomePage({super.key, required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => getIt<HomeCubit>()..loadCategories(),
      child: HomeView(drawerKey: drawerKey),
    );
  }
}

class HomeView extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;
  
  const HomeView({super.key, required this.drawerKey});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            
            if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            
            if (state is HomeLoaded) {
              return PrimaryContainer(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(category: state.categories[index]);
                  },
                ),
              );
            }
            
            return const Center(child: Text('Welcome to Home'));
          },
        ),
      ),
    );
  }
}
