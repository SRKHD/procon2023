import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/component_types.dart';
import '../component/control/number_textfield.dart';
import '../component/training/training_kind_dropdown.dart';
import '../component/training/training_list_item.dart';
import '../notifier/datetime_notifier.dart';
import '../notifier/training/training_list_provider.dart';
import '../notifier/text_notifier.dart';
import '../notifier/training/training_kind_notifier.dart';
import '../notifier/user/login_user_provider.dart';
import '../state/training/training_state.dart';

class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({super.key});

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
    final kindState = ref.watch(trainingKindNotifierProvider);
    final logInUserState = ref.watch(logInUserNotifierProvider);

    print(logInUserState.userId);
    print(logInUserState.userName);
    final dateState = ref.watch(dateTimeNotifierProvider);

    Expanded listView(List<TrainingState> trainings) {
      return Expanded(
        child: ListView(
          children: trainings
              .map(
                (e) => TrainingLiteItem(
                  kind: e.kind,
                  date: e.date,
                  value: e.value,
                ),
              )
              .toList(),
        ),
      );
    }

    final textField = NumberTextField(
      controller: _controller,
      notifier: ref.watch(textNotifierProvider.notifier),
      labelText: 'トレーニング量',
      hintText: switch (kindState) {
        TrainingKind.walk => '歩いた時間',
        TrainingKind.run => '走った時間',
        TrainingKind.workOut => '筋トレ時間',
      },
    );

    final textComponents = SizedBox(
      width: 300,
      child: textField,
    );

    final button = ElevatedButton.icon(
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

    return trainingState.when(
      data: (trainings) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              listView(trainings),
              TrainingKindDropdown(),
              calenderComponents,
              textComponents,
              button,
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
