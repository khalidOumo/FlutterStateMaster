import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_master/data/models/category_model.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRemoteRepositoryImpl categoryRemoteRepositoryImpl;
  
  CategoryCubit({required this.categoryRemoteRepositoryImpl}) : super(CategoryInitial());

  Future<void> fetchCategories() async {
     emit(CategoryLoading());
      final result = await categoryRemoteRepositoryImpl.getCategories();
      result.fold(
        (failure) => emit(CategoryError(message: failure.message)),
        (categories) => emit(CategoryLoaded(categories: categories)),
      );
  }

}
