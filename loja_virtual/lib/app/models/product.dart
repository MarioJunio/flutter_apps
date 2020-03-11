import 'package:loja_virtual/app/models/category.dart';

class Product {
  String id;
  Category category;
  String description;
  double price;
  List<dynamic> sizes;
  List<String> images;

  bool get hasCategory => category != null;

  Product.fromMap(Map<String, dynamic> data)
      : this.description = data["description"],
        this.price = data["price"],
        this.sizes = data["sizes"],
        this.images = data["images"];

  Map<String, dynamic> get toMap => {
        "id": id,
        "category": hasCategory ? category.toMap : null,
        "description": description,
        "price": price.toDouble(),
        "sizes": sizes,
        "images": images
      };
}
