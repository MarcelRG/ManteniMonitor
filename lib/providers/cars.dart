import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'car.dart';

class Cars with ChangeNotifier {
  List<Car> _items = [
    Car(
      id: 'NL12355',
      plate: 'NL12355',
      maker: 'Freightliner',
      model: 'M2',
      description: 'A description of the car.',
      imageUrl:
      'https://cdn.bringatrailer.com/wp-content/uploads/2018/12/2007_freightliner_m2_sportchassis_15460205361e1f8cbe183b92007_freightliner_m2_sportchassis_1545878322ff9f98764da20181118_163812-1-940x627.jpg',
    ),
    Car(
      id: 'NL13245',
      plate: 'NL13245',
      maker: 'Kenworth',
      model: 'T604',
      description: 'A description of the car.',
      imageUrl:
      'https://live.staticflickr.com/3741/33368586612_09f688ba2c_b.jpg',
    ),
    Car(
      id: 'NL14523',
      plate: 'NL14523',
      maker: 'Peterbilt',
      model: '567',
      description: 'A description of the car.',
      imageUrl:
      'https://d2uhsaoc6ysewq.cloudfront.net/50224/Day-Cab-Semi-Trucks-Peterbilt-567-13835697.jpg',
    ),
    Car(
      id: 'NL12345',
      plate: 'NL12345',
      maker: 'International',
      model: 'LT',
      description: 'A description of the car.',
      imageUrl:
      'https://www.ccjdigital.com/wp-content/uploads/sites/10/2017/03/International-LT-2017-2017-03-08-10-04-e1490801502700.jpg',
    ),
    Car(
      id: 'NL54321',
      plate: 'NL54321',
      maker: 'Freightliner',
      model: 'Argosy',
      description: 'A description of the car.',
      imageUrl:
      'https://photos7.motorcar.com/used-2012-freightliner-argosy-6x4-13303-19129624-1-1024.jpg',
    )
  ];

  List<Car> get items{
    return [..._items];
  }

  Car findById(String id){
    return _items.firstWhere((cr) => cr.id == id);
  }

  Future<void> addCar(Car car){
    const url = 'https://fimsa-proyecto.firebaseio.com/Unidades.json';
    return http.post(url, body: json.encode({
      'plate' : car.plate,
      'maker' : car.maker,
      'model' : car.model,
      'description' : car.description,
      'imageUrl' : car.imageUrl,
      'isDriving' : car.isDriving,
    }),
    )
        .then((response) {
      final newCar = Car(
        plate: car.plate,
        maker: car.maker,
        model: car.model,
        description: car.description,
        imageUrl: car.imageUrl,
        //id: DateTime.now().toString(),
        id: json.decode(response.body)['name'],
      );
      _items.insert(0, newCar);
      notifyListeners();
    });
  }

  void updateCar(String id, Car newCar){
    final carIndex = _items.indexWhere((car)=>car.id == id);
    if(carIndex>=0) {
      _items[carIndex] = newCar;
      notifyListeners();
    }else{
      print('...');
    }
  }

  void deleteCar(String id){
    _items.removeWhere((car)=>car.id == id);
    notifyListeners();
  }
}