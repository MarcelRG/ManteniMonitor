import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cars.dart';

class CarDetailScreen extends StatelessWidget {
  static const routeName = 'car_detail';

  @override
  Widget build(BuildContext context) {
    final carID =
      ModalRoute.of(context).settings.arguments as String;
    final loadedCar = Provider.of<Cars>(
      context,
      listen: false,
    ).findById(carID);
    return Scaffold(
      appBar: AppBar(
          title: Text(loadedCar.maker)
      ),
      body: Text('cuerpo')
    );
  }
}