import 'package:flutter_application_1/models/catalog.dart';

class CartModel{



  //catalog field
  late CatalogModel _catalog;

  //Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];
  

  //get catalog : no one can directly use _catalog to do so use catalog
  CatalogModel get catalog => _catalog;

  //set new catalog to new catalog
  set catalog(CatalogModel newCatalogModel){
    assert(newCatalogModel!=null);//newcatalog can not be null
    _catalog = newCatalogModel;
  }

  //get items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();


  //get total price
  // num get totalPrice => items.fold(initialValue, (previousValue, element) => null)
     num get totalPrice => items.fold(0, (total, current) => total+current.price);


  //add item
  void add(Item item){
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}