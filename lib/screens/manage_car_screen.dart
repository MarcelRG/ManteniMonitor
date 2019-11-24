import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:manteni_monitor/providers/car.dart';
import 'package:manteni_monitor/widgets/app_drawer.dart';
import 'package:manteni_monitor/widgets/manage_car_item.dart';
import 'package:provider/provider.dart';

import '../providers/cars.dart';
import './edit_car_screen.dart';

class ManageCarScreen extends StatefulWidget {
  const ManageCarScreen({Key key}) : super(key: key);

  static const routeName = '/manage-cars';

  @override
  State<StatefulWidget> createState() => new _ManageCarScreenState();
}

class _ManageCarScreenState extends State<ManageCarScreen> {
  List<Car> cars;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseDatabase.instance.reference().child("Unidades").once().then((snap) {
      print("Unidades");

      final value = snap.value as Map;
      List<Car> tmp = new List<Car>();
      for (final key in value.keys) {
        Map<dynamic, dynamic> map = value[key];
        print(map);
        tmp.add(new Car(
            id: key,
            description: map["descripcion"],
            imageUrl: map["imagen"],
            model: map["modelo"],
            maker: map["marca"],
            plate: map["matricula"],
            year: map["año"]
            ));
        // tmp.add({...map, "id": key});
      }
      setState(() {
        cars = tmp;
      });
      print("CARS");
      print(cars);
      print(cars.length);
      print(cars[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final carsData = Provider.of<Cars>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Administra camiones'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditCarScreen.routeName);
              },
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: this.cars == null
              ? null
              : ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (_, i) => ManageCarItem(
                    cars[i].id,
                    cars[i].plate,
                    cars[i].imageUrl,
                    cars[i].maker,
                    cars[i].model,
                    cars[i].year
                  ),
                ),
        ));
  }
}
