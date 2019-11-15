import 'package:flutter/foundation.dart';

class Car with ChangeNotifier{
  final String id;
  final String maker;
  final String model;
  final String description;
  final String imageUrl;
  bool isDriving;

  Car({
    @required this.id,
    @required this.maker,
    @required this.model,
    @required this.description,
    @required this.imageUrl,
    this.isDriving = false,
  });
}