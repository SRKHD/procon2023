import 'package:flutter/material.dart';

class UserLiteItem extends StatelessWidget {
  const UserLiteItem({
    super.key,
    required this.birthday,
    required this.name,
    required this.thumbnailLink,
  });

  final String name;
  final String thumbnailLink;
  final String birthday;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(backgroundImage: NetworkImage(thumbnailLink)),
    );
  }
}
