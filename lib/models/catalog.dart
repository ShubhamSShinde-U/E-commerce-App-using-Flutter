class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price,required  this.color,required this.image,});

  // Item(this.id, this.name, this.desc, this.price, this.color, this.image, {required id});
}


class CatalogModel{
  static final items =[
   Item(
    id:001,
    name:"14Pro Max",
    desc: "lorem50jsdfjksddddddddddd",
    price: 600,
    color:"#232323",
    image:"https://th.bing.com/th/id/OIP.xhnvEObwHYLOpJdwH5iIaAHaHa?pid=ImgDet&rs=1"
  ),
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