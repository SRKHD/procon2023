import 'package:bodquest_2023/presentation/component/chart/scrollable_line_chart.dart';
import 'package:bodquest_2023/presentation/state/weight_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../component/number_textfield.dart';
import '../component/weight_list_item.dart';
import '../notifier/datetime_notifier.dart';
import '../notifier/login_user_notifier.dart';
import '../notifier/text_notifier.dart';
import '../notifier/weight_list_notifier.dart';

class WeightPage extends ConsumerStatefulWidget {
  const WeightPage({super.key});

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
    final dateState = ref.watch(dateTimeNotifierProvider);

    Expanded weightChart(List<WeightState> weights) {
      return Expanded(
        child: ScrollableLineChart(
          dataSeries: weights,
          fx: (weight) => weight.timestamp.toDouble(),
          fy: (weight) => weight.value,
          dataFormatter: (weight) {
            return "${weight.date}\n${weight.value}kg";
          },
          xFormatter: (x) {
            final formatter = DateFormat("M/d");
            final dtInMs = x.toInt();
            final dt = DateTime.fromMillisecondsSinceEpoch(dtInMs);

            return formatter.format(dt);
          },
          verticalGridInterval: Duration(days: 1).inMilliseconds.toDouble(),
        ),
      );
    }

    Expanded listView(List<WeightState> weights) {
      return Expanded(
        child: ListView(
          children: weights
              .map(
                (e) => WeightLiteItem(
                  userId: e.userId,
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
      labelText: '体重',
      hintText: '体重を入力',
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

    final button = ElevatedButton.icon(
      onPressed: () {
        final text = ref.watch(textNotifierProvider);
        final notifier = ref.read(weightListNotifierProvider.notifier);
        notifier.addWeight(
            logInUserState.userId, dateState, double.parse(text));
        _controller.text = '';
      },
      label: Text('登録'),
      icon: const Icon(Icons.add),
    );

    return state.when(
      data: (weights) {
        weights.sort((a, b) => a.timestamp.compareTo(b.timestamp));
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              weightChart(weights),
              listView(weights),
              calenderComponents,
              textField,
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
