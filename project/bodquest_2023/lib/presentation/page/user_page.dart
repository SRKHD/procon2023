import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/user/login_user_provider.dart';
import '../provider/user/user_list_provider.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends ConsumerState<UserPage> {
  DateTime _dateTime = DateTime.now();
  double _height = 0;
  String _gender = "";
  bool _isFirstLoad = true;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _heightController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logInUserState = ref.watch(logInUserNotifierProvider);
    final userListState = ref.read(userListNotifierProvider);

    return userListState.when(
      data: (users) {
        var userState =
            users.firstWhere((element) => element.id == logInUserState.userId);
        if (userState.id.isNotEmpty) {
          _genderController.text = userState.gender;
          if (_isFirstLoad) {
            _heightController.text = userState.height.toString();
            _userNameController.text = userState.name;
            _gender = _genderController.text;
            _dateTime = DateTime.parse(userState.birthday);
            _isFirstLoad = false;
          }
        }
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
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 15.0),
                child: TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(labelText: "ユーザー名"),
                )),

            // 性別
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0, 25.0, 15.0),
              child: Row(
                children: [
                  Radio(
                      value: 'male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      }),
                  Text('男性'),
                  Radio(
                      value: 'female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      }),
                  Text('女性'),
                  Radio(
                      value: "other",
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      }),
                  Text('未設定'),
                ],
              ),
            ),

            // 生年月日
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: Row(
                  children: <Widget>[
                    Text("生年月日: ", style: TextStyle(fontSize: 16)),
                    Text(
                        _dateTime == DateTime(1500)
                            ? '未設定'
                            : '  ${_dateTime.year}/${_dateTime.month}/${_dateTime.day}  ',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
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

            // 身長
            Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
                child: TextFormField(
                  controller: _heightController,
                  decoration: InputDecoration(labelText: "身長 (cm)"),
                  onChanged: (String value) {
                    _height = double.parse(value);
                  },
                )),

            // 保存
            ElevatedButton.icon(
              onPressed: () {
                final notifier = ref.read(userListNotifierProvider.notifier);
                notifier.updateUserInfo(logInUserState.userId,
                    _userNameController.text, _dateTime, _height, _gender);
              },
              label: Text('保存'),
              icon: const Icon(Icons.save),
            ),
          ],
        )));
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
