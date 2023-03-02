// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/themes.dart';
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
      backgroundColor: Mytheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              // CatalogList(),
              const CatalogHeader(),
              if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                const CatalogList().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatefulWidget {
  const CatalogHeader({super.key});

  @override
  State<CatalogHeader> createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catalog App".text.xl5.color(Mytheme.darkBluishColor).make(),
              "Latest Products".text.xl2.make()
            ],
          );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder:(context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog:catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: VxBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            CatalogImage(image: catalog.image),
            Expanded(
              
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl.color(Mytheme.darkBluishColor).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Mytheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())
                      ), 
                      child: "Buy".text.make()
                      )
                  ],
                )
              ],
            ))
          ],),
        )
      ).white.rounded.square(150).make().py16(),//padding veritcal only i.e. py
    );//similar to container
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return  Image.network(image).box.rounded.p8.color(Mytheme.creamColor).make().p16().w40(context);
  }
}
