import 'package:flutter/material.dart';
import '../screens/manage_car_screen.dart';

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
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.check_circle_outline),
            title: Text('Administra Camiones'),
            onTap:() {
              Navigator.of(context).pushReplacementNamed(ManageCarScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}