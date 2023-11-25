import 'package:flutter/material.dart';

class MainLeftDrawer extends StatefulWidget {
  MainLeftDrawer({Key? key}) : super(key: key);

  @override
  State<MainLeftDrawer> createState() => _MainLeftDrawerState();
}

class _MainLeftDrawerState extends State<MainLeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 3'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}