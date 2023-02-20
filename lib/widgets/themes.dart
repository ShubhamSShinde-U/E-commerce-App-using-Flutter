import 'package:flutter/material.dart';

class Mytheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context)=> ThemeData(
    primarySwatch: Colors.deepPurple,
    // fontFamily: 
    appBarTheme: AppBarTheme(
      color: Colors.white,
      
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,
    ));

    static ThemeData darkTheme(BuildContext context)=> ThemeData(
    brightness: Brightness.dark,
    );
}