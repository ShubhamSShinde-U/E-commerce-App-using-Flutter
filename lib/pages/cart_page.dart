import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPAge extends StatelessWidget {
  const CartPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.black.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (BuildContext context, store, VxStatus? status) { 
              return "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make();
              },
            )
          ,
          30.widthBox,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not yet supprted".text.make()));
          },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)), 
          child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty?  "Nothing to Show!!!".text.xl3.makeCentered() : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) =>  ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline), 
          onPressed: (){
            // _cart.remove(_cart.items[index]);
            RemoveMutation(_cart.items[index]);
            // setState(() {});
          },
          ),
          title:_cart.items[index].name.text.make(),
      ),
    );
  }
}