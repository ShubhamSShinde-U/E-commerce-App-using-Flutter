import "package:flutter/material.dart";
import 'package:flutter_application_1/widgets/drawer.dart';
class HomePage extends StatelessWidget {
  final int day = 20;
  final String name = "Shubham";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app" , style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        // child:Container(
          child: Text("Wel come to $day days of flutter by $name"),
        // ),
        ),
      drawer: MyDrawer(),
    );
  }
}