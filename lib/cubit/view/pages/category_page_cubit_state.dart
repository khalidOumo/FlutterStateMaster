import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_master/cubit/viewmodel/category_cubit/category_cubit.dart';
import 'package:state_master/data/core/widgets/build_skeleton_widgets.dart';
import 'package:state_master/data/core/widgets/category_card_widget.dart';
import 'package:state_master/data/core/widgets/error_try_widgets.dart';

class CategoryPageCubitState extends StatelessWidget {
  const CategoryPageCubitState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(
        categoryRemoteRepositoryImpl:context.read(),
      )..fetchCategories(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: const Text("Categories"),
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return BuildSkeletonWidget();
            }

            if (state is CategoryError) {
              return ErrorTryWidget(
                message: state.message,
                onRetry: () {
                  context.read<CategoryCubit>().fetchCategories();
                },
              );
            }

            if (state is CategoryLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3/3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, i) {
                  final c = state.categories[i];
                  return CategoryCardWidget(category: c);
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

}
