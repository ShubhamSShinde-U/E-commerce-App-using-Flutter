import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  final int day = 20;
  final String name = "Shubham";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app"),
      ),
      body: Center(
        // child:Container(
          child: Text("Wel come to $day days of flutter by $name"),
        // ),
        ),
      drawer: Drawer(),
    );
  }
}