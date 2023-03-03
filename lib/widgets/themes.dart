import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
class Mytheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context)=> ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily, 
    cardColor: Colors.white,
    canvasColor: creamColor,
    accentColor: darkBluishColor,
    buttonColor: darkBluishColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: Theme.of(context).textTheme,
    ));

    static ThemeData darkTheme(BuildContext context)=> ThemeData(
    brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily, 
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      )
    );
    //colors
    static Color creamColor = const Color(0xfff5f5f5);
    static Color darkBluishColor = const Color(0xff403b50);
    static Color darkcreamColor = Vx.gray900;
    static Color lightBluishColor = Vx.indigo500;
}