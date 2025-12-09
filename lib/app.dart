import 'package:flutter/material.dart';
import 'package:state_master/Provider/view/pages/category_page_provider_state.dart';
import 'package:state_master/Riverpod/view/pages/category_page_riverpod_state.dart';
import 'package:state_master/bloc/views/pages/category_page_bloc_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master State',
      debugShowCheckedModeBanner: false,
      home: const CategoryPageRiverpodState(),
    );
  }
}