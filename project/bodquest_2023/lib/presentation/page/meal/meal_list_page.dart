import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/meal/meal_listview.dart';
import '../../provider/meal/meal_list_provider.dart';
import '../../router/go_router.dart';
import '../../router/page_path.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class MealListPage extends ConsumerWidget {
  const MealListPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final state = ref.watch(mealListNotifierProvider);
    final notifier = ref.watch(mealListNotifierProvider.notifier);
    return state.when(
      data: (meals) {
        meals.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColor.moriGreen,
            title: const Text(L10n.list),
          ),
          body: Column(
            children: [
              Expanded(
                child: MealListView(
                  meals: meals,
                  onPressed: (userId, id) {
                    final router = ref.read(goRouterProvider);
                    router.pushNamed(
                      PageId.meal.routeName,
                      pathParameters: {'id': id},
                    );
                  },
                  onPressedDelete: (userId, id) => notifier.delete(userId, id),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
