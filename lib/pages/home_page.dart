// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
//dart convert: json encoder decoder
import 'dart:convert';

import '../widgets/home_widgets/caatalog_header.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int day = 20;

  final String name = "Shubham";

  @override
  void initState() {//agar data haya pehle aa jaye to mai build method ko directly de sakta hu: so initState used
    super.initState();
    loadData();
  }

  loadData() async{
    //to load data from JSON file we can use root bundle which is placed in service library
    var catalogJson = await rootBundle.loadString("assests/files/catalog.json");//this will return future so we have to wait so add await at start 

    var decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();//getting list of items
    // print(productData);//here  I will get mapped data

    setState(() {});//set state to fetch all data
  }
  @override
  Widget build(BuildContext context){//context is element which decides location of each widget
    return Scaffold(
      backgroundColor: context.cardColor ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.theme.buttonColor,
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartroute);
        },
        child: const Icon(CupertinoIcons.cart,color: Colors.white,),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              // CatalogList(),
              const CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                const CatalogList().p8().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}





