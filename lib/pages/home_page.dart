// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
//dart convert: json encoder decoder
import 'dart:convert';

import '../widgets/drawer.dart';
import '../widgets/drawer.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/caatalog_header.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int day = 20;

  final String name = "Shubham";
  final url = "https://api.jsonbin.io/v3/b/6406165cace6f33a22ea5290";
  @override
  void initState() {//agar data haya pehle aa jaye to mai build method ko directly de sakta hu: so initState used
    super.initState();
    loadData();
  }

  loadData() async{
    //to load data from JSON file we can use root bundle which is placed in service library
    // var catalogJson = await rootBundle.loadString("assests/files/catalog.json");//this will return future so we have to wait so add await at start 

    // var decodedData = jsonDecode(catalogJson);
    // var productData = decodedData["products"];

    await Future.delayed(Duration(seconds: 2));
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["record"];

    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();//getting list of items
    // print(productData);//here  I will get mapped data


    setState(() {});//set state to fetch all data
  }
  @override
  Widget build(BuildContext context){//context is element which decides location of each widget
    final _Cart  = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.cardColor ,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation,RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) =>
        FloatingActionButton(
          backgroundColor: context.theme.buttonColor,
          onPressed: (){
            Navigator.pushNamed(context, MyRoutes.cartroute);
          },
          child: const Icon(CupertinoIcons.cart,color: Colors.white,),
        ).badge(
          color: Vx.red500,size: 22,count:_Cart.items.length,
          textStyle: const TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold,
          )
          ),
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





