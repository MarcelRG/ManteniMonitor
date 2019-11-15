import 'package:flutter/material.dart';

import '../widgets/cars_grid.dart';

class CarOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: Text(
            'ManteniMonitor',
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
      body: CarsGrid(),
    );
  }
}
