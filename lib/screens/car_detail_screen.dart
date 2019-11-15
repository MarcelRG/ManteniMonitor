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
        title: Text(
          'ManteniMonitor',
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedCar.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${loadedCar.maker}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 50.0,
              ),
            ),
            Text(
              '${loadedCar.model}',
              style: TextStyle(
                fontSize: 25.0,
              )
            )
          ],
        ),
      )
    );
  }
}