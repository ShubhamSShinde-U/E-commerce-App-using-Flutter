import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Login Page",
        style: TextStyle(
          fontSize: 20,
          color: Colors.amber,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}