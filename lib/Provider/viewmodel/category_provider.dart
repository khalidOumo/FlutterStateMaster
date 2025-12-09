import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:state_master/data/core/errors/failures.dart';
import 'package:state_master/data/models/category_model.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';
//provider
 

class CategoryProvider extends ChangeNotifier {
  // Category provider implementation
  final CategoryRemoteRepositoryImpl categoryRemoteRepositoryImpl;
  CategoryProvider({required this.categoryRemoteRepositoryImpl});

  bool isLoading = false;
  String? errorMessage;
  List<CategoryModel> categories = [];


  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();

    final Either<Failure, List<CategoryModel>> result =
        await categoryRemoteRepositoryImpl.getCategories();

    result.fold(
      (failure) {
        errorMessage = failure.message;
        isLoading = false;
        notifyListeners();
      },
      (data) {
        categories = data;
        errorMessage = null;
        isLoading = false;
        notifyListeners();
      },
    );
  }
  
}