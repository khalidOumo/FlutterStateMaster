import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';
import 'category_notifier.dart';
import 'category_state.dart';

final categoryRemoteRepositoryProvider =
    Provider<CategoryRemoteRepositoryImpl>((ref) {
  return CategoryRemoteRepositoryImpl();
});

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  final repo = ref.read(categoryRemoteRepositoryProvider);
  return CategoryNotifier(repo);
});
