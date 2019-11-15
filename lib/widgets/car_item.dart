import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final String id;
  final String maker;
  final String model;
  final String imageUrl;

  CarItem(this.id, this.maker, this.model, this.imageUrl);
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        header: GridTileBar(
          leading: IconButton(
            icon: Icon(
                Icons.more_vert
            ),
              onPressed: () {},
          ),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            maker,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0
            ),
          ),

          trailing: Text(
            id,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),

          ),
        ),
      ),
    );
  }
}
