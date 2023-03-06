// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price,required  this.color,required this.image,});

  //I am commenting this to try new extension: dart data class generator
  // factory Item.fromMap(Map<String,dynamic> map) { //factory: helps to choose the constructor, to work with final data
  //   return Item(                                  //to create constructor we use class_name.new_name
  //     id: map["id"], 
  //     name: map["name"], 
  //     desc: map["desc"], 
  //     price: map["price"], 
  //     color: map["color"], 
  //     image: map["image"]
  //     );
  // }


  //use cmd+shift+p

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as num,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.price == price &&
      other.color == color &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      price.hashCode ^
      color.hashCode ^
      image.hashCode;
  }
}


class CatalogModel{
  static List<Item> items =[  
    //as we want data in list format in home_page so make it of type List<Item>
  // Item(
  //  id:001,
  //    name:"14Pro Max",
  //    desc: "lorem50jsdfjksddddddddddd",
  //    price: 600,
  //    color:"#232323",
  //    image:"https://th.bing.com/th/id/OIP.xhnvEObwHYLOpJdwH5iIaAHaHa?pid=ImgDet&rs=1"
  //  ),
];

  static final catalogModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catalogModel;

  Item getById(int id) => items.firstWhere((element) => element.id == id, orElse: null);
  Item getByPos(int pos) => items[pos];
}