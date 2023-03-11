import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';
import 'pages/home_page.dart';
import 'utils/routes.dart';
// import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp( VxState(
    store: MyStore(),
  child: MyApp()));
}

class MyApp extends StatelessWidget{
  @override

  Widget build (BuildContext context){
      return MaterialApp(
          // home: HomePage(),
          themeMode: ThemeMode.system,
          theme: Mytheme.LightTheme(context),
          darkTheme: Mytheme.darkTheme(context),
          debugShowCheckedModeBanner: false,
          initialRoute: MyRoutes.homeRoute,
          routes: {
            "/":(context)=>LoginPage(),
            MyRoutes.homeRoute:(context) => HomePage(),
            MyRoutes.loginRoute:(context) => const LoginPage(),
            MyRoutes.cartroute:(context) => const CartPAge()
          },
      ); 
  }
}