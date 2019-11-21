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
            child: Text('Header'),
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
            )
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
          fontSize: 27.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
        ],
      ),
      body: CarsGrid(),
    );
  }
}
