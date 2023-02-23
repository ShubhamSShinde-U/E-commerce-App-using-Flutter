import "package:flutter/material.dart";
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

import '../widgets/item_widget.dart';
class HomePage extends StatelessWidget {
  final int day = 20;
  final String name = "Shubham";

  @override
  Widget build(BuildContext context){//context is element which decides location of each widget
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app" , style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          return  ItemWidget(item: CatalogModel.items[index],);//presentaiton
        },
        ),
    ),
      
      drawer: MyDrawer(),
    );
  }
}