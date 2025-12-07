part of 'category_bloc.dart';

@immutable
abstract class CategoryState  extends Equatable{}

class CategoryInitial extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories; 

  CategoryLoaded({required this.categories});
  
  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}


class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});
  
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}