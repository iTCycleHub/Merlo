// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../models/category_model.dart';

abstract class HomeLocalDataSource {
  Future<List<CategoryModel>> getCachedCategories();
}

@Injectable(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<CategoryModel>> getCachedCategories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return [
      const CategoryModel(
        id: '1',
        name: 'AC Repair',
        icon: 'assets/icons/ac_repair.svg',
        color: Color(0xFFFFBC99),
      ),
      const CategoryModel(
        id: '2',
        name: 'Beauty',
        icon: 'assets/icons/beauty.svg',
        color: Color(0xFFCABDFF),
      ),
      const CategoryModel(
        id: '3',
        name: 'Appliance',
        icon: 'assets/icons/appliance.svg',
        color: Color(0xFFB1E5FC),
      ),
      const CategoryModel(
        id: '4',
        name: 'Painting',
        icon: 'assets/icons/paint.svg',
        color: Color(0xFFB5EBCD),
      ),
      const CategoryModel(
        id: '5',
        name: 'Cleaning',
        icon: 'assets/icons/cleaning.svg',
        color: Color(0xFFFFD88D),
      ),
      const CategoryModel(
        id: '6',
        name: 'Plumbing',
        icon: 'assets/icons/plumbing.svg',
        color: Color(0xFFCBEBA4),
      ),
      const CategoryModel(
        id: '7',
        name: 'Electronics',
        icon: 'assets/icons/electronic.svg',
        color: Color(0xFFFB9B9B),
      ),
      const CategoryModel(
        id: '8',
        name: 'Shifting',
        icon: 'assets/icons/shifting.svg',
        color: Color(0xFFF8B0ED),
      ),
      const CategoryModel(
        id: '9',
        name: 'Mens Salon',
        icon: 'assets/icons/facial.svg',
        color: Color(0xFFAFC6FF),
      ),
    ];
  }
}
