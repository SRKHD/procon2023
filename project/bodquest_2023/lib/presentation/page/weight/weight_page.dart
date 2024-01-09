import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../component/control/number_textfield.dart';
import '../../component/weight/weight_list_button.dart';
import '../../notifier/text_notifier.dart';
import '../../provider/datetime_provider.dart';
import '../../provider/user/login_user_provider.dart';
import '../../notifier/weight/weight_list_provider.dart';
import '../../router/go_router.dart';
import '../../router/page_path.dart';
import '../../state/datetime_state.dart';

class WeightPage extends ConsumerStatefulWidget {
  WeightPage({super.key});

  final initDate = DateTime.now();

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
    final dateState = ref.watch(datetimeNotifierProvider(widget.initDate));

    final textField = NumberTextField(
      controller: _controller,
      notifier: ref.watch(textNotifierProvider.notifier),
      labelText: '体重',
      hintText: '体重を入力',
    );

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateState.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
      );

      if (picked != null) {
        setState(() {
          final notifier =
              ref.watch(datetimeNotifierProvider(dateState.value).notifier);
          notifier.update(DateTimeState(value: picked));
        });
      }
    }

    final calenderComponents = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            '選択した日付: ${dateState.value.year}/${dateState.value.month}/${dateState.value.day}'),
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
        notifier.add(
            logInUserState.userId, dateState.value, double.parse(text));
        _controller.text = '';
      },
      label: Text('登録'),
      icon: const Icon(Icons.add),
    );

    final synchronizeHealthiaButton = ElevatedButton.icon(
      onPressed: () {
        final notifier = ref.read(weightListNotifierProvider.notifier);
        notifier.synchronizeHealthia(logInUserState.userId, dateState.value);
      },
      label: Text(''),
      icon: const Icon(Icons.downloading),
    );

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [resisterButton, synchronizeHealthiaButton],
    );

    final listButton = WeightListButton(onPressed: () {
      final router = ref.read(goRouterProvider);
      router.pushNamed(
        PageId.weightlist.routeName,
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
