import 'package:bodquest_2023/presentation/notifier/user/user_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/user/login_user_notifier.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends ConsumerState<UserPage> {
  String _userName = "";
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final logInUserState = ref.watch(logInUserNotifierProvider);
    final userState = ref.watch(userListNotifierProvider);
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
                _userName = value;
              },
            )),

        // 生年月日
        Padding(
            padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Row(
              children: <Widget>[
                Text("生年月日: ", style: TextStyle(fontSize: 18)),
                Text(
                    '  ${_dateTime.year}/${_dateTime.month}/${_dateTime.day}  '),
                ElevatedButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 1, 1),
                        maxTime: DateTime(2023, 12, 31), onConfirm: (date) {
                      setState(() {
                        _dateTime = date;
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
            final notifier = ref.read(userListNotifierProvider.notifier);
            notifier.updateUserInfo(
                logInUserState.userId, _userName, _dateTime);
          },
          label: Text('保存'),
          icon: const Icon(Icons.save),
        ),
      ],
    )));
  }
}
