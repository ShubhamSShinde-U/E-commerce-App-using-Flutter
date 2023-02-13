import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatelessWidget {
  // const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
     child:SingleChildScrollView(
     child: Column(
      children: [
        Image.asset(
          "assests/images/login.png" , 
          fit:BoxFit.cover,
          // height: 600,
          ),
        SizedBox(
          height: 20.0,
          child: Text("Hello All !!!"),
        ),
        Text("Welcome" , 
            style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
            decoration: InputDecoration(
              hintText: "Enter UserName",
              labelText: "UserName",
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Password",
            ),
          ),
          SizedBox(
            height: 50.0,

          ),
          ElevatedButton(
            onPressed: (){
              print("HI Shubham");
              //one page to another page
              Navigator.pushNamed(context, MyRoutes.homeRoute);
            }, 
            child: Text("Login"),
            style: TextButton.styleFrom(minimumSize: Size(150,40)),
            )
            ],
          ),
        )
      ],
     ),
     )
    );
  }
}