import 'package:flutter/material.dart';
import 'package:manteni_monitor/widgets/manage_car_item.dart';
import 'package:provider/provider.dart';

import '../providers/cars.dart';

class ManageCarScreen extends StatelessWidget {
  static const routeName = '/manage-cars';
  @override
  Widget build(BuildContext context) {
    final carsData = Provider.of<Cars>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar/Editar camiones'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){

            },
          )
        ],
      ),
    body: Padding(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: carsData.items.length,
          itemBuilder: (_, i) => ManageCarItem(
              carsData.items[i].id,
          carsData.items[i].imageUrl
          ),
        ),
      )
    );
  }
}