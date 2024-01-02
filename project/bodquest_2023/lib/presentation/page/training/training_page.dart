import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../component/component_types.dart';
import '../../component/control/number_textfield.dart';
import '../../component/training/training_kind_dropdown.dart';
import '../../component/training/training_list_button.dart';
import '../../notifier/datetime_notifier.dart';
import '../../notifier/training/training_list_provider.dart';
import '../../notifier/text_notifier.dart';
import '../../notifier/training/training_kind_notifier.dart';
import '../../notifier/user/login_user_provider.dart';
import '../../router/go_router.dart';
import '../../router/page_path.dart';

class TrainingPage extends ConsumerStatefulWidget {
  TrainingPage({super.key});

  final initDate = DateTime.now();

  @override
  TrainingPageState createState() => TrainingPageState();
}

class TrainingPageState extends ConsumerState<TrainingPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trainingState = ref.watch(trainingListNotifierProvider);
    final kindState =
        ref.watch(trainingKindNotifierProvider(TrainingKind.walk));
    final logInUserState = ref.watch(logInUserNotifierProvider);

    print(logInUserState.userId);
    print(logInUserState.userName);
    final dateState = ref.watch(dateTimeNotifierProvider(widget.initDate));

    final textField = NumberTextField(
      controller: _controller,
      notifier: ref.watch(textNotifierProvider.notifier),
      labelText: 'トレーニング量',
      hintText: switch (kindState) {
        TrainingKind.walk => '歩いた歩数',
        TrainingKind.run => '走った距離(m)',
        TrainingKind.workOut => '筋トレ時間(分)',
      },
    );

    final textComponents = SizedBox(
      width: 300,
      child: textField,
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
          final notifier =
              ref.watch(dateTimeNotifierProvider(dateState).notifier);
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
        // print('保存されている文字は: $text');
        final notifier = ref.read(trainingListNotifierProvider.notifier);
        notifier.addTraining(
            logInUserState.userId, kindState.name, dateState, int.parse(text));
        _controller.text = '';
      },
      label: Text('登録'),
      icon: const Icon(Icons.add),
    );

    final synchronizeHealthiaButton = ElevatedButton.icon(
      onPressed: () {
        final notifier = ref.read(trainingListNotifierProvider.notifier);
        notifier.synchronizeHealthia(logInUserState.userId, dateState);
      },
      label: Text(''),
      icon: const Icon(Icons.downloading),
    );

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [resisterButton, synchronizeHealthiaButton],
    );

    final listButton = TrainingListButton(onPressed: () {
      final router = ref.read(goRouterProvider);
      router.pushNamed(
        PageId.traininglist.routeName,
        //pathParameters: {'id': memo.id},
      );
    });
    return trainingState.when(
      data: (trainings) {
        return Scaffold(
          floatingActionButton: listButton,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TrainingKindDropdown(kindState),
                calenderComponents,
                textComponents,
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
