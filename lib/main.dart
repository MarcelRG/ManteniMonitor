import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/car_overview_screen.dart';
import './screens/car_detail_screen.dart';
import './providers/cars.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Cars(),
      child: MaterialApp(
        title: 'ManteniMonitor',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          fontFamily: 'Montserrat'
        ),
        home: CarOverviewScreen(),
        routes: {
          CarDetailScreen.routeName: (ctx) => CarDetailScreen(),
        },
      ),
    );
  }
}


