class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price,required  this.color,required this.image,});


  factory Item.fromMap(Map<String,dynamic> map) { //factory: helps to choose the constructor, to work with final data
    return Item(                                  //to create constructor we use class_name.new_name
      id: map["id"], 
      name: map["name"], 
      desc: map["desc"], 
      price: map["price"], 
      color: map["color"], 
      image: map["image"]
      );
  }
}


class CatalogModel{
  static List<Item> items =[  //as we want data in list format in home_page so make it of type List<Item>
   Item(
    id:001,
    name:"14Pro Max",
    desc: "lorem50jsdfjksddddddddddd",
    price: 600,
    color:"#232323",
    image:"https://th.bing.com/th/id/OIP.xhnvEObwHYLOpJdwH5iIaAHaHa?pid=ImgDet&rs=1"
  ),
];
}