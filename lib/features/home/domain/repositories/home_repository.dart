// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:dartz/dartz.dart';
import '../../../../core/domain/failures/failure.dart';
import '../entities/category.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
