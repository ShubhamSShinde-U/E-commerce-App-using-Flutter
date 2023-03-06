// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';

import '../models/cart.dart';

class MyStore extends VxStore {
  CatalogModel catalog = CatalogModel();
  CartModel cart  = CartModel();
  // cart.catalog = catalog;
  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }

}
