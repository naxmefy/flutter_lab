import 'package:flutter/material.dart';

class SimpleDrawer extends StatelessWidget {
  const SimpleDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Drawer Header"),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text("Item 1"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Item 2"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
