import 'package:bodquest_2023/presentation/component/meal/mealRegister_kind_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/component_types.dart';
import '../component/control/number_textfield.dart';
import '../component/meal/meal_kind_dropdown.dart';
import '../component/meal/meal_list_button.dart';
import '../notifier/datetime_notifier.dart';
import '../notifier/meal/mealRegister_kind_notifier.dart';
import '../notifier/meal/meal_kind_notifier.dart';
import '../notifier/text_notifier.dart';
import '../provider/meal/meal_list_provider.dart';
import '../provider/user/login_user_provider.dart';
import '../router/go_router.dart';
import '../router/page_path.dart';

class RecipePage extends ConsumerStatefulWidget {
  RecipePage({super.key});

  final initDate = DateTime.now();

  @override
  RecipePageState createState() => RecipePageState();
}

class RecipePageState extends ConsumerState<RecipePage> {
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
    final mealRegisterState =
        ref.watch(mealRegisterKindNotifierProvider(MealRegisterKind.meal));
    final mealState = ref.watch(mealListNotifierProvider);
    final kindState = ref.watch(mealKindNotifierProvider(MealKind.breakfast));
    final logInUserState = ref.watch(logInUserNotifierProvider);

    print(logInUserState.userId);
    print(logInUserState.userName);
    final dateState = ref.watch(dateTimeNotifierProvider(widget.initDate));

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
        final notifier = ref.read(mealListNotifierProvider.notifier);
        var calorie =
            _calorieController.text == '' ? '-1' : _calorieController.text;
        notifier.add(logInUserState.userId, kindState.name, _controller.text,
            dateState, int.parse(calorie), '');
        _controller.text = '';
        _calorieController.text = '';
      },
      label: Text('登録'),
      icon: const Icon(Icons.add),
    );

    final listButton = MealListButton(onPressed: () {
      final router = ref.read(goRouterProvider);
      router.pushNamed(
        PageId.meallist.routeName,
      );
    });

    return mealState.when(
      data: (meals) {
        return Scaffold(
          floatingActionButton: listButton,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MealRegisterKindDropDown(mealRegisterState),
                MealKindDropdown(kindState),
                calenderComponents,
                textComponents,
                calorieTextComponents,
                resisterButton,
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
