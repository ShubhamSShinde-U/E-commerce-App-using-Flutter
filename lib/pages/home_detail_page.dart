// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "\$${catalog.price}".text.bold.xl3.make(),
                      AddToCart(catalog:catalog).wh(120,50)
                    ],
                  ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.image.toString()),
              child: Image.network(catalog.image).h32(context)
              ),
            Expanded(
              child: VxArc(

                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child:Column(children: [
                    catalog.name.text.bold.xl4.color(context.accentColor).make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    10.heightBox,
                    "Turpis tristique lectus conubia. Condimentum dapibus. Viverra hendrerit. Mauris vestibulum. Vitae pharetra dis dolor sociis eleifend fames aptent aenean nullam, conubia viverra aptent a ultricies.Conubia inceptos. Sem cum metus condimentum morbi. Consectetuer odio volutpat tortor quis eget Blandit tempus non scelerisque montes. Est mauris rhoncus.Libero sociosqu nunc. Mollis habitasse proin integer auctor odio tempor tempor euismod fringilla venenatis proin per nascetur aliquet vestibulum natoque nunc, aptent praesent cursus.".text.textStyle(context.captionStyle).make().p16()
                  ],).py64()
                ),
              ) 
            )
          ],
        ),
      ),
    );
  }
}
