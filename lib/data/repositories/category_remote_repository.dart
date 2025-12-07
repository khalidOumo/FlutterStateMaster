import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:state_master/data/errors/failures.dart';
import 'package:state_master/data/models/category_model.dart';

abstract class CategoryRemoteRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategories();
}

class CategoryRemoteRepositoryImpl implements CategoryRemoteRepository {
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final url = Uri.parse('https://api.escuelajs.co/api/v1/categories');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final categories = jsonData.map((category) => CategoryModel.fromJson(category)).toList();
        return Right(categories);
      } else {
        return Left(ServerFailure(message: "Failed to load categories"));
      }
    } catch (e) {
      if (e is SocketException) {
        return Left(NetworkFailure(message: "No Internet Connection"));
      }
      return Left(ServerFailure(message: "Failed to load categories"));
    }
  }

}
