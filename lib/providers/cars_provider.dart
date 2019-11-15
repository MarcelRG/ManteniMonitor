import 'package:flutter/material.dart';
import '../models/car.dart';

class Cars with ChangeNotifier {
  List<Car> _items = [
    Car(
      id: 'NL12345',
      maker: 'Freightliner',
      model: 'M2',
      description: 'A description of the car.',
      imageUrl:
      'https://http2.mlstatic.com/freightliner-m2-2017-camarote-credito-disponible-tomo-auto-D_NQ_dNP_721355-MLM30669501854_052019-F.jpg',
    ),
    Car(
      id: 'NL13245',
      maker: 'Kenworth',
      model: 'T604',
      description: 'A description of the car.',
      imageUrl:
      'https://live.staticflickr.com/3741/33368586612_09f688ba2c_b.jpg',
    ),
    Car(
      id: 'NL14523',
      maker: 'Peterbilt',
      model: '567',
      description: 'A description of the car.',
      imageUrl:
      'https://d2uhsaoc6ysewq.cloudfront.net/50224/Day-Cab-Semi-Trucks-Peterbilt-567-13835697.jpg',
    ),
    Car(
      id: 'NL12345',
      maker: 'International',
      model: 'LT',
      description: 'A description of the car.',
      imageUrl:
      'https://www.ccjdigital.com/wp-content/uploads/sites/10/2017/03/International-LT-2017-2017-03-08-10-04-e1490801502700.jpg',
    ),
    Car(
      id: 'NL54321',
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
  void addCar(){
    //_items.add(price);
    notifyListeners();
  }
}