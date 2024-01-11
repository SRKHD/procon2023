import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/util/datetime_utils.dart';
import '../../../domain/value/meal_kind.dart';
import '../../component/control/number_textfield.dart';
import '../../component/meal/meal_kind_dropdown.dart';
import '../../notifier/text_notifier.dart';
import '../../provider/datetime_provider.dart';
import '../../provider/meal/meal_kind_provider.dart';
import '../../provider/meal/meal_list_provider.dart';
import '../../router/go_router.dart';
import '../../state/datetime_state.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class MealEditPage extends ConsumerStatefulWidget {
  const MealEditPage(this.id, {super.key});

  final String id;

  @override
  MealEditPageState createState() => MealEditPageState();
}

class MealEditPageState extends ConsumerState<MealEditPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _calorieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mealState = ref.watch(mealListNotifierProvider);

    return mealState.when(
      data: (meals) {
        final state = meals.firstWhere((element) => element.id == widget.id);
        DateTime date = toDate(state.date);
        final dateState = ref.watch(datetimeNotifierProvider(date));
        final kindState =
            ref.watch(mealKindNotifierProvider(MealKind.from(state.kind)));
        _controller.text = state.name.toString();
        _calorieController.text = state.calorie.toString();

        final textField = TextFormField(
          controller: _controller,
          decoration: InputDecoration(labelText: "食事"),
        );

        final textComponents = SizedBox(
          width: 300,
          height: 70,
          child: textField,
        );

        final calorieText = NumberTextField(
          controller: _calorieController,
          notifier: ref.watch(textNotifierProvider.notifier),
          labelText: 'カロリー',
          hintText: 'カロリーを入力',
        );

        final calorieTextComponents = SizedBox(
          width: 300,
          height: 90,
          child: calorieText,
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

        final updateButton = ElevatedButton.icon(
          onPressed: () {
            final notifier = ref.read(mealListNotifierProvider.notifier);
            var calorie =
                _calorieController.text == '' ? '-1' : _calorieController.text;

            notifier.update(state.userId, state.id, kindState.value.toString(),
                _controller.text, dateState.value, int.parse(calorie), null);

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
                MealKindDropdown(kindState.value),
                calenderComponents,
                textComponents,
                calorieTextComponents,
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
