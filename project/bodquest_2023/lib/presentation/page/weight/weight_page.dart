import 'package:bodquest_2023/presentation/component/weight/weight_list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../component/control/number_textfield.dart';
import '../../notifier/datetime_notifier.dart';
import '../../notifier/text_notifier.dart';
import '../../notifier/user/login_user_provider.dart';
import '../../notifier/weight/weight_list_provider.dart';
import '../../router/go_router.dart';
import '../../router/page_path.dart';

class WeightPage extends ConsumerStatefulWidget {
  const WeightPage({super.key});

  @override
  WeightPageState createState() => WeightPageState();
}

class WeightPageState extends ConsumerState<WeightPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(weightListNotifierProvider);
    final logInUserState = ref.watch(logInUserNotifierProvider);
    final dateState = ref.watch(dateTimeNotifierProvider);

    final textField = NumberTextField(
      controller: _controller,
      notifier: ref.watch(textNotifierProvider.notifier),
      labelText: '体重',
      hintText: '体重を入力',
    );

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateState,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
      );

      if (picked != null) {
        setState(() {
          final notifier = ref.watch(dateTimeNotifierProvider.notifier);
          notifier.update(picked);
        });
      }
    }

    final calenderComponents = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('選択した日付: ${dateState.year}/${dateState.month}/${dateState.day}'),
        ElevatedButton(
          onPressed: () => selectDate(context),
          child: const Text('日付選択'),
        ),
      ],
    );

    final resisterButton = ElevatedButton.icon(
      onPressed: () {
        final text = ref.watch(textNotifierProvider);
        final notifier = ref.read(weightListNotifierProvider.notifier);
        notifier.addWeight(
            logInUserState.userId, dateState, double.parse(text));
        _controller.text = '';
      },
      label: Text('登録'),
      icon: const Icon(Icons.add),
    );

    final synchronizeHealthiaButton = ElevatedButton.icon(
      onPressed: () {
        final notifier = ref.read(weightListNotifierProvider.notifier);
        notifier.synchronizeHealthia(logInUserState.userId, dateState);
      },
      label: Text(''),
      icon: const Icon(Icons.downloading),
    );

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [resisterButton, synchronizeHealthiaButton],
    );

    final listButton = WeightListButton(onPressed: () {
      // 編集画面へ進む
      final router = ref.read(goRouterProvider);
      router.pushNamed(
        PageId.weightlist.routeName,
        //pathParameters: {'id': memo.id},
      );
    });

    return state.when(
      data: (weights) {
        weights.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        return Scaffold(
          floatingActionButton: listButton,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                calenderComponents,
                textField,
                buttons,
              ],
            ),
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
