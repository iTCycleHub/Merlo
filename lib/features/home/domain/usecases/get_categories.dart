// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/failures/failure.dart';
import '../../../../core/domain/usecases/use_case.dart';
import '../entities/category.dart';
import '../repositories/home_repository.dart';

@injectable
class GetCategories implements UseCase<List<Category>, NoParams> {
  const GetCategories(this._repository);

  final HomeRepository _repository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await _repository.getCategories();
  }
}
