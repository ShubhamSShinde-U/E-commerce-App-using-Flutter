import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
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