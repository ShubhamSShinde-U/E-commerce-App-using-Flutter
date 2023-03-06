import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_image.dart';
// import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder:(context, index) {
        // final catalog = CatalogModel.items[index];
        final catalog = CatalogModel.getByPos(index);
        return InkWell(
          onTap: (
            () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder:(context)=> HomeDetailPage(
                  catalog: catalog,
                  )
                )
              )
            ),
          child: CatalogItem(catalog:catalog) ,
        );//InkWell gives OnTap method
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
            
            Hero(
              tag: Key(catalog.image.toString()),
              child: CatalogImage(image: catalog.image)),
            Expanded(
              
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl.color(context.accentColor).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                // 10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(const StadiumBorder())
                      ), 
                      child: "Add to Cart".text.make()
                      )
                  ],
                )
              ],
            ))
          ],),
        )
      ).color(context.cardColor).rounded.square(150).make(),//padding veritcal only i.e. py
    );//similar to container
  }
}