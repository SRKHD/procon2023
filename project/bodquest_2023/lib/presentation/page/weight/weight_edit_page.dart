import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/util/datetime_utils.dart';
import '../../component/control/number_textfield.dart';
import '../../notifier/datetime_notifier.dart';
import '../../notifier/text_notifier.dart';
import '../../notifier/weight/weight_list_provider.dart';
import '../../router/go_router.dart';
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
    final itemsState = ref.watch(weightListNotifierProvider);
    final textField = NumberTextField(
      controller: _controller,
      notifier: ref.watch(textNotifierProvider.notifier),
      labelText: '体重',
      hintText: '体重を入力',
    );

    return itemsState.when(
      data: (weights) {
        final state = weights.firstWhere((element) => element.id == widget.id);
        DateTime date = toDate(state.date);
        final dateState = ref.watch(dateTimeNotifierProvider(date));
        _controller.text = state.value.toString();

        Future<void> selectDate(BuildContext context) async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: dateState,
            firstDate: DateTime(2020),
            lastDate: DateTime(2025),
          );

          if (picked != null) {
            setState(() {
              final dateNotifier =
                  ref.watch(dateTimeNotifierProvider(dateState).notifier);
              //date = picked;
              dateNotifier.update(picked);
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

        final resisterButton = ElevatedButton.icon(
          onPressed: () {
            final text = ref.watch(textNotifierProvider);
            final notifier = ref.read(weightListNotifierProvider.notifier);

            notifier.update(
                state.userId, state.id, dateState, double.parse(text));

            final router = ref.read(goRouterProvider);
            router.pop();
          },
          label: Text('更新'),
          icon: const Icon(Icons.autorenew),
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
