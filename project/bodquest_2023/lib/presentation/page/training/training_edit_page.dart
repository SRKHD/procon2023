import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/util/datetime_utils.dart';
import '../../component/component_types.dart';
import '../../component/control/number_textfield.dart';
import '../../component/training/training_kind_dropdown.dart';
import '../../notifier/datetime_notifier.dart';
import '../../provider/training/training_list_provider.dart';
import '../../notifier/text_notifier.dart';
import '../../notifier/training/training_kind_notifier.dart';
import '../../router/go_router.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class TrainingEditPage extends ConsumerStatefulWidget {
  const TrainingEditPage(this.id, {super.key});

  final String id;

  @override
  TrainingEditPageState createState() => TrainingEditPageState();
}

class TrainingEditPageState extends ConsumerState<TrainingEditPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trainingState = ref.watch(trainingListNotifierProvider);

    return trainingState.when(
      data: (trainings) {
        final state =
            trainings.firstWhere((element) => element.id == widget.id);
        DateTime date = toDate(state.date);
        DateTime dateState = ref.watch(dateTimeNotifierProvider(date));
        TrainingKind kindState = ref
            .watch(trainingKindNotifierProvider(TrainingKind.from(state.kind)));
        _controller.text = state.value.toString();
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
            Text(
                '選択した日付: ${dateState.year}/${dateState.month}/${dateState.day}'),
            ElevatedButton(
              onPressed: () => selectDate(context),
              child: const Text('日付選択'),
            ),
          ],
        );

        final updateButton = ElevatedButton.icon(
          onPressed: () {
            final text = _controller.text; //ref.watch(textNotifierProvider);
            final notifier = ref.read(trainingListNotifierProvider.notifier);

            notifier.update(state.userId, state.id, kindState.value, dateState,
                int.parse(text));

            final router = ref.read(goRouterProvider);
            router.pop();
          },
          label: Text('更新'),
          icon: const Icon(Icons.autorenew),
        );

        final buttons = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [updateButton],
        );

        return Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColor.moriGreen,
            title: const Text(L10n.edit),
          ),
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
