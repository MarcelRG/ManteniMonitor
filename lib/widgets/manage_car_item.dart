import 'package:flutter/material.dart';

class ManageCarItem extends StatelessWidget{
  final String id;
  final String imageUrl;

  ManageCarItem(this.id, this.imageUrl);

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

            },
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){

            },
            color: Theme.of(context).errorColor,
          ),
        ],
        ),
      ),
    );
  }
}