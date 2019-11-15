import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cars.dart';
import './car_item.dart';

class CarsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final carsData = Provider.of<Cars>(context);
    final cars = carsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),

      itemCount : cars.length,
      itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
        value: cars[i],
          child: CarItem(
          cars[i].id,
          cars[i].maker,
          cars[i].model,
          cars[i].imageUrl,
        )
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio:  1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}