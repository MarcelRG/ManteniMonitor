import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_car_screen.dart';
import '../providers/cars.dart';

class ManageCarItem extends StatelessWidget{
  final String id;
  final String plate;
  final String imageUrl;

  ManageCarItem(this.id, this.plate, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(id),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: (){
              Navigator.of(context).pushNamed(EditCarScreen.routeName, arguments: id);
            },
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){
              Provider.of<Cars>(context, listen: false).deleteCar(id);
            },
            color: Theme.of(context).errorColor,
          ),
        ],
        ),
      ),
    );
  }
}