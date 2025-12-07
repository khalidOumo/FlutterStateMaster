import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_master/app.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';

Future<void> main() async {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => CategoryRemoteRepositoryImpl()),
      ],
      child: const MyApp(),
    ),
  );
}
