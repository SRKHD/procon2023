import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/menu/menu_listview.dart';
import '../../provider/menu/menu_list_provider.dart';
import '../../router/go_router.dart';
import '../../router/page_path.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class MealListPage extends ConsumerWidget {
  const MealListPage({super.key});

  @override
  Widget build(context, WidgetRef ref) {
    final state = ref.watch(menuListNotifierProvider);
    final notifier = ref.watch(menuListNotifierProvider.notifier);
    return state.when(
      data: (menus) {
        //menus.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColor.moriGreen,
            title: const Text(L10n.list),
          ),
          body: Column(
            children: [
              Expanded(
                child: MenuListView(
                  menus: menus,
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
