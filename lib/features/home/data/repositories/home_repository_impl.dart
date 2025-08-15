// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/failures/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource _localDataSource;

  const HomeRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categoryModels = await _localDataSource.getCachedCategories();
      final categories = categoryModels.map((model) => model.toEntity()).toList();
      return Right(categories);
    } catch (e) {
      return Left(Failure.localFailure(message: 'Error al obtener categorías'));
    }
  }
}
