import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:state_master/data/models/category_model.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteRepositoryImpl categoryRemoteRepositoryImpl;
  CategoryBloc({required this.categoryRemoteRepositoryImpl}) : super(CategoryInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoryLoading());
      final result = await categoryRemoteRepositoryImpl.getCategories();
      result.fold(
        (failure) => emit(CategoryError(message: failure.message)),
        (categories) => emit(CategoryLoaded(categories: categories)),
      );
    });
  }
}
