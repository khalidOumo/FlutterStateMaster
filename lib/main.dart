import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_master/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';

//bloc/cubit/provider setup
// Future<void> main() async {
//   runApp(
//     MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider(create: (context) => CategoryRemoteRepositoryImpl()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

//flutter_riverpod setup
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}