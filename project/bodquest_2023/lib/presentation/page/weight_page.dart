import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/weight_list_item.dart';
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
    const userId = 'srkhd.2023@gmail.com';
    String inputValue = '0';

    return state.when(
      data: (weights) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: weights
                      .map(
                        (e) => WeightLiteItem(
                          useId: e.userId,
                          value: e.value,
                        ),
                      )
                      .toList(),
                ),
              ),
              TextField(
                textAlign: TextAlign.right,
                decoration: const InputDecoration(hintText: '体重を入力'),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[1-9]+[0-9]*(\.([1-9]*|[0-9]+[1-9]+))?$'))
                ],
                controller: _controller,
                onChanged: (value) {
                  inputValue = value;
                },
              ),
              ElevatedButton.icon(
                onPressed: () {
                  final notifier =
                      ref.read(weightListNotifierProvider.notifier);
                  notifier.addWeight(userId, double.parse(inputValue));
                  _controller.text = '';
                },
                label: Text('登録'),
                icon: const Icon(Icons.add),
              ),
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
