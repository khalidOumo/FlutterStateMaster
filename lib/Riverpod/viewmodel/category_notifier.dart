import 'package:flutter_riverpod/legacy.dart';
import 'package:state_master/data/core/errors/failures.dart';
import 'package:state_master/data/models/category_model.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';
import 'category_state.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final CategoryRemoteRepositoryImpl repo;

  CategoryNotifier(this.repo) : super(const CategoryState());

  Future<void> fetchCategories() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final result = await repo.getCategories();

    result.fold(
      (Failure failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
      },
      (List<CategoryModel> data) {
        state = state.copyWith(
          isLoading: false,
          categories: data,
          errorMessage: null,
        );
      },
    );
  }
}
