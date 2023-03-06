
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   AddToCart({
    super.key, required this.catalog,
  });
  
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: (){
       
        if(!isInCart){
         
          // _cart.catalog = _catalog; //set catalog 
         AddMutation(catalog);
          //setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(const StadiumBorder())
      ), 
      child: isInCart ? const Icon(Icons.done): const Icon(CupertinoIcons.cart_badge_plus)
      );
  }
}