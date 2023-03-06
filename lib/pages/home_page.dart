import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:http/http.dart' as http;
//dart convert: json encoder decoder
import 'dart:convert';

import '../widgets/home_widgets/caatalog_header.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int day = 20;

  final String name = "Shubham";
  final url ="https://api.jsonbin.io/v3/b/6405e540c0e7653a05834f86";

  @override
  void initState() {//agar data haya pehle aa jaye to mai build method ko directly de sakta hu: so initState used
    super.initState();
    loadData();
  }

  loadData() async{
    
    await Future.delayed(const Duration(seconds: 2));
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];

    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
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





