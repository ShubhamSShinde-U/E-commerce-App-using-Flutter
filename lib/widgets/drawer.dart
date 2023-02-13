// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://drive.google.com/file/d/1UG2Q8h82aVu7iIdJdXVy8_4enr-bm6tF/view?usp=share_link";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Shubham Shinde"),
                accountEmail: Text("shubhamshindeg1@gmail.com"),
                
                // currentAccountPicture:CircleAvatar(
                //   backgroundImage: Image.asset('assests/images/img_shubham.jpg'),
                //   ),
                )
              ),

              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Info",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  "Contact",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}