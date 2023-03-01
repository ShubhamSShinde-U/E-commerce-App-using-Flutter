import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
//dart convert: json encoder decoder
import 'dart:convert';

import '../widgets/item_widget.dart';
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
      appBar: AppBar(
        title: const Text("Catalog app" , style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 
          (CatalogModel.items!=null && CatalogModel.items.isNotEmpty)? 
          GridView.builder(
            itemCount: CatalogModel.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(//delegate fixes the no. of items in each row
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              ), 
            itemBuilder: ( context,  index) { 
              final item = CatalogModel.items[index];
              return Card( 
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                ),
                child: GridTile(
                  header: Container(
                    padding:  const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    ),
                  child: Image.network(
                    item.image,
                    ),
                  footer: Container(
                    padding:  const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Text(item.price.toString(),style: const TextStyle(
                      color: Colors.white,
                    ),)),
                  ),
              );
             },
          ):const Center(
            child: CircularProgressIndicator(),
          ),
      ),
      
      drawer: MyDrawer(),
    );
  }
}