import 'package:flutter/foundation.dart';

class Car with ChangeNotifier{
  final String id;
  final String plate;
  final String maker;
  final String model;
  final String description;
  final String imageUrl;
  final String year;
  bool isDriving;
  bool isInCharge;

  Car({
    @required this.id,
    @required this.plate,
    @required this.maker,
    @required this.model,
    @required this.description,
    @required this.imageUrl,
    @required this.year,
    this.isDriving = false,
    this.isInCharge = false,
  });
}