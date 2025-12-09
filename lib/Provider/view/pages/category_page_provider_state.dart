import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_master/Provider/viewmodel/category_provider.dart';
import 'package:state_master/data/core/widgets/build_skeleton_widgets.dart';
import 'package:state_master/data/core/widgets/category_card_widget.dart';
import 'package:state_master/data/core/widgets/error_try_widgets.dart';
import 'package:state_master/data/repositories/category_remote_repository.dart';

class CategoryPageProviderState extends StatelessWidget {
  const CategoryPageProviderState({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryProvider(
          categoryRemoteRepositoryImpl: context.read<CategoryRemoteRepositoryImpl>())
        ..fetchCategories(),
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
        body: Consumer<CategoryProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return BuildSkeletonWidget();
            }

            if (provider.errorMessage != null) {
              return ErrorTryWidget(
                message: provider.errorMessage!,
                onRetry: () => provider.fetchCategories(),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0, // مربع
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: provider.categories.length,
              itemBuilder: (context, i) {
                final c = provider.categories[i];
                return CategoryCardWidget(category: c);
              },
            );
          },
        ),
      ),
    );
  }



}
