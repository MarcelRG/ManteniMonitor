import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Conductor'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Camiones'),
            onTap:() {
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
    );
  }
}