import 'package:bodquest_2023/presentation/notifier/datetime_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/component_types.dart';
import '../component/number_textfield_widget.dart';
import '../component/training_kind_dropdown_widget.dart';
import '../notifier/text_notifier.dart';
import '../notifier/training_kind_notifier.dart';
import '../notifier/weight_list_notifier.dart';

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
    final state = ref.watch(weightListNotifierProvider);
    final kind = ref.watch(trainingKindNotifierProvider);
    const userId = 'srkhd.2023@gmail.com';
    final dateState = ref.watch(dateTimeNotifierProvider);

    final textField = NumberTextField(
      controller: _controller,
      notifier: ref.watch(textNotifierProvider.notifier),
      labelText: 'トレーニング量',
      hintText: switch (kind) {
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
        print('保存されている文字は: $text');
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

    return state.when(
      data: (weights) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Expanded(
              //   child: ListView(
              //       // children: weights
              //       //     .map(
              //       //       (e) => TrainingLiteItem(
              //       //         useId: e.userId,
              //       //         value: e.value,
              //       //       ),
              //       //     )
              //       //     .toList(),
              //       ),
              // ),
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
