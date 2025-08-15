// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/failures/failure.dart';
import '../../../../core/domain/usecases/use_case.dart';
import '../../domain/usecases/get_categories.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetCategories _getCategories;

  HomeCubit(this._getCategories) : super(const HomeInitial());

  Future<void> loadCategories() async {
    emit(const HomeLoading());
    
    final result = await _getCategories(NoParams());
    
    result.fold(
      (failure) => emit(HomeError(_getFailureMessage(failure))),
      (categories) => emit(HomeLoaded(categories)),
    );
  }

  String _getFailureMessage(Failure failure) {
    switch (failure) {
      case LocalFailure(:final message):
        return message;
      case ServerFailure(:final message):
        return message;
    }
  }
}
