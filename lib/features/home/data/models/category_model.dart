// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  final Color color;

  const CategoryModel({
    required String id,
    required String name,
    required String icon,
    required this.color,
    bool isActive = true,
  }) : super(
          id: id,
          name: name,
          icon: icon,
          isActive: isActive,
        );

  Category toEntity() => Category(
        id: id,
        name: name,
        icon: icon,
        isActive: isActive,
      );
}
