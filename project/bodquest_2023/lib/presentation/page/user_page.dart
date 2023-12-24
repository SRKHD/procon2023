import 'package:bodquest_2023/presentation/component/control/chart/scrollable_line_chart.dart';
import 'package:bodquest_2023/presentation/notifier/user/user_list_notifier.dart';
import 'package:bodquest_2023/presentation/state/weight/weight_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../component/control/number_textfield.dart';
import '../component/weight/weight_list_item.dart';
import '../notifier/datetime_notifier.dart';
import '../notifier/user/login_user_notifier.dart';
import '../notifier/text_notifier.dart';
import '../notifier/weight/weight_list_notifier.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends ConsumerState<UserPage> {
  final TextEditingController _controller = TextEditingController();
  String _dateText = "";
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateState = ref.watch(dateTimeNotifierProvider);

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
            child: Text('プロフィール編集',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

        // ユーザー名
        Padding(
            padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: TextFormField(
              decoration: InputDecoration(labelText: "ユーザー名"),
              onChanged: (String value) {
                // todo
              },
            )),

        // 生年月日
        Padding(
            padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Row(
              children: <Widget>[
                Text("生年月日: ", style: TextStyle(fontSize: 18)),
                Text(
                    ' 選択した日付: ${dateState.year}/${dateState.month}/${dateState.day}  '),
                ElevatedButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime(2023, 12, 31), onConfirm: (date) {
                      setState(() {
                        _dateText = '${date.year}年${date.month}月${date.day}日';
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.jp);
                  },
                  child: const Text('生年月日選択'),
                ),
              ],
            )),

        // 保存
        ElevatedButton.icon(
          onPressed: () {
            //todo
          },
          label: Text('保存'),
          icon: const Icon(Icons.save),
        ),
      ],
    )));
  }
}
