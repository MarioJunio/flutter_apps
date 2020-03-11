import 'package:loja_virtual/app/models/product.dart';

class Category {
  String id;
  String title;
  String icon;
  List<Product> products;

  Category.fromMap(Map<String, dynamic> data)
      : this.title = data["title"],
        this.icon = data["icon"];

  Map<String, dynamic> get toMap => {
        "id": id,
        "title": title,
        "icon": icon,
        "items": products.map((e) => e.toMap).toList()
      };
}
