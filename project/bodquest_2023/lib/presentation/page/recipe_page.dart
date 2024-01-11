import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/value/meal_kind.dart';
import '../../domain/value/meal_register_kind.dart';
import '../component/control/number_textfield.dart';
import '../component/meal/mealRegister_kind_dropdown.dart';
import '../component/meal/meal_kind_dropdown.dart';
import '../component/meal/meal_list_button.dart';
import '../component/menu/menu_list_button.dart';
import '../notifier/text_notifier.dart';
import '../provider/datetime_provider.dart';
import '../provider/meal/meal_kind_provider.dart';
import '../provider/meal/meal_list_provider.dart';
import '../provider/meal/meal_register_kind_provider.dart';
import '../provider/menu/menu_list_provider.dart';
import '../provider/user/login_user_provider.dart';
import '../router/go_router.dart';
import '../router/page_path.dart';
import '../state/datetime_state.dart';

class RecipePage extends ConsumerStatefulWidget {
  RecipePage({super.key});

  final initDate = DateTime.now();

  @override
  RecipePageState createState() => RecipePageState();
}

class RecipePageState extends ConsumerState<RecipePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();
  bool _isMeal = true;
  String _label = "";

  Uint8List? registrationImage;

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
    _isMeal = mealRegisterState.value == MealRegisterKind.meal;
    final mealState = ref.watch(mealListNotifierProvider);
    final kindState = ref.watch(mealKindNotifierProvider(MealKind.breakfast));
    final logInUserState = ref.watch(logInUserNotifierProvider);
    final picker = ImagePicker();

    print(logInUserState.userId);
    print(logInUserState.userName);
    final dateState = ref.watch(datetimeNotifierProvider(widget.initDate));

    _label = _isMeal ? "食事" : "献立";
    final textField = TextFormField(
      controller: _controller,
      decoration: InputDecoration(labelText: _label),
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

    final resisterButton = ElevatedButton.icon(
      onPressed: () {
        if (_isMeal) {
          final mealNotifier = ref.read(mealListNotifierProvider.notifier);
          var calorie =
              _calorieController.text == '' ? '-1' : _calorieController.text;
          mealNotifier.add(
              logInUserState.userId,
              kindState.value.stringValue,
              _controller.text,
              dateState.value,
              int.parse(calorie),
              registrationImage);
          _controller.text = '';
          _calorieController.text = '';
          registrationImage = null;
        } else {
          final recipeNotifier = ref.read(menuListNotifierProvider.notifier);
          recipeNotifier.add(logInUserState.userId, '', dateState.value,
              _controller.text, '', -1, registrationImage);
          _controller.text = '';
        }
      },
      label: Text('登録'),
      icon: const Icon(Icons.add),
    );

    final yolov5Button = ElevatedButton.icon(
      onPressed: () {
        final router = ref.read(goRouterProvider);
        router.pushNamed(
          PageId.yolov5.routeName,
        );
      },
      label: Text('スキャン'),
      icon: const Icon(Icons.search),
    );

    final mealListButton = MealListButton(onPressed: () {
      final router = ref.read(goRouterProvider);
      router.pushNamed(
        PageId.meallist.routeName,
      );
    });

    final recipeListButton = MenuListButton(onPressed: () {
      final router = ref.read(goRouterProvider);
      router.pushNamed(
        PageId.recipelist.routeName,
      );
    });

    Future<Uint8List?> galleryImagePicker() async {
      XFile? file = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );

      if (file != null)
        return await file.readAsBytes(); // convert into Uint8List.
      return null;
    }

    final imageButton = ElevatedButton.icon(
      onPressed: () async {
        final Uint8List? image = await galleryImagePicker();
        if (image != null) {
          registrationImage = image;
          setState(() {});
        }
      },
      label: Text('画像登録'),
      icon: const Icon(Icons.add),
    );

    final imageTextComponent = SizedBox(
      width: 300,
      child: registrationImage == null
          ? const Text('画像が選択されていません')
          : Image.memory(
              registrationImage!,
              fit: BoxFit.cover,
            ),
    );

    final registerImage = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [imageButton, imageTextComponent, Text('')],
    );

    final listButton = _isMeal ? mealListButton : recipeListButton;
    return mealState.when(
      data: (meals) {
        return Scaffold(
          floatingActionButton: listButton,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MealRegisterKindDropDown(mealRegisterState.value),
                Visibility(
                  visible: _isMeal,
                  child: MealKindDropdown(kindState.value),
                ),
                Visibility(
                  visible: _isMeal,
                  child: calenderComponents,
                ),
                textComponents,
                Visibility(
                  visible: _isMeal,
                  child: calorieTextComponents,
                ),
                Visibility(
                  visible: _isMeal,
                  child: registerImage,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    resisterButton,
                    yolov5Button,
                  ],
                ),
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
