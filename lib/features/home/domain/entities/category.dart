// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String icon;
  final bool isActive;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [id, name, icon, isActive];

  @override
  String toString() {
    return 'Category(id: , name: , icon: , isActive: )';
  }
}
