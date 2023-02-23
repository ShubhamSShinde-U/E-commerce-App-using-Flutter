import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  // const ItemWidget({super.key});


  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(    //wrap with the card to show box
      shape: const StadiumBorder(),
      shadowColor: Colors.blue,
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.5,//increse the font size
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          ),//tralling put data on right side
      ),
    );//ListTile widget used to show listview items
  }
}