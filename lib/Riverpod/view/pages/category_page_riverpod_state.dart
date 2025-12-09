import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_master/Riverpod/viewmodel/providers.dart';
import 'package:state_master/data/core/widgets/build_skeleton_widgets.dart';
import 'package:state_master/data/core/widgets/category_card_widget.dart';
import 'package:state_master/data/core/widgets/error_try_widgets.dart';

class CategoryPageRiverpodState extends ConsumerStatefulWidget {
  const CategoryPageRiverpodState({super.key});

  @override
  ConsumerState<CategoryPageRiverpodState> createState() =>
      _CategoryPageRiverpodState();
}

class _CategoryPageRiverpodState extends ConsumerState<CategoryPageRiverpodState> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryProvider.notifier).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return BuildSkeletonWidget();
          }

          if (state.errorMessage != null) {
            return ErrorTryWidget(
              message: state.errorMessage!,
              onRetry: () =>
                  ref.read(categoryProvider.notifier).fetchCategories(),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: state.categories.length,
            itemBuilder: (context, i) {
              final c = state.categories[i];
              return CategoryCardWidget(category: c);
            },
          );
        },
      ),
    );
  }
}
