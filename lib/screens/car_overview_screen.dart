import 'package:flutter/material.dart';

import '../widgets/cars_grid.dart';

class CarOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ManteniMonitor')
        ),
        body: CarsGrid(),
    );
  }
}

