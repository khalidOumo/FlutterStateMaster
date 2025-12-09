import 'package:state_master/data/models/category_model.dart';

class CategoryState {
  final bool isLoading;
  final String? errorMessage;
  final List<CategoryModel> categories;

  const CategoryState({
    this.isLoading = false,
    this.errorMessage,
    this.categories = const [],
  });

  CategoryState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<CategoryModel>? categories,
  }) {
    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      categories: categories ?? this.categories,
    );
  }
}
