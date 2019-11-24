import 'package:flutter/material.dart';
import 'package:manteni_monitor/widgets/app_drawer.dart';

import '../widgets/cars_grid.dart';
// Main car dart
class CarOverviewScreen extends StatelessWidget {
  static const routeName = '/carOverviewScreen';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
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
