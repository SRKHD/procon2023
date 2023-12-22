import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../notifier/user/user_list_notifier.dart';
import 'user_list_item.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userListNotifierProvider);
    return state.when(
      data: (users) {
        return ListView(
          children: users
              .map(
                (e) => UserLiteItem(
                    birthday: e.birthday,
                    name: e.name,
                    thumbnailLink: e.thumbnailLink),
              )
              .toList(),
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
