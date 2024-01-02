import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/util/datetime_utils.dart';
import '../../component/control/number_textfield.dart';
import '../../notifier/datetime_notifier.dart';
import '../../notifier/text_notifier.dart';
import '../../notifier/weight/editing_weight_provider.dart';
import '../../theme/colors.dart';
import '../../theme/l10n.dart';

class WeightEditPage extends ConsumerStatefulWidget {
  const WeightEditPage(this.id, {super.key});

  final String id;
  @override
  WeightEditPageState createState() => WeightEditPageState();
}

class WeightEditPageState extends ConsumerState<WeightEditPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editingWeightNotifierProvider(widget.id));
    //final logInUserState = ref.watch(logInUserNotifierProvider);
    final date = toDate(state.date);
    _controller.text = state.value.toString();

    final textField = NumberTextField(
      controller: _controller,
      notifier: ref.watch(textNotifierProvider.notifier),
      labelText: '体重',
      hintText: '体重を入力',
    );

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
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
        Text('選択した日付: ${date.year}/${date.month}/${date.day}'),
        ElevatedButton(
          onPressed: () => selectDate(context),
          child: const Text('日付選択'),
        ),
      ],
    );

    final resisterButton = ElevatedButton.icon(
      onPressed: () {
        // final text = ref.watch(textNotifierProvider);
        // final notifier = ref.read(weightListNotifierProvider.notifier);
        //notifier.add(logInUserState.userId, dateState, double.parse(text));
        //_controller.text = '';
      },
      label: Text('更新'),
      icon: const Icon(Icons.add),
    );

    final buttons = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [resisterButton],
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
            calenderComponents,
            textField,
            buttons,
          ],
        ),
      ),
    );
  }
}
