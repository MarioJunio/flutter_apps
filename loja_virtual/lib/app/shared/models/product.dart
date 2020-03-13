class Product {
  String id;
  String description;
  double price;
  List<dynamic> sizes;
  List<dynamic> images;

  Product.fromMap(String id, Map<String, dynamic> data)
      : this.id = id,
        this.description = data["description"],
        this.price = (data["price"] ?? 0).toDouble(),
        this.sizes = data["sizes"],
        this.images = data["images"];

  Map<String, dynamic> get toMap => {
        "id": id,
        "description": description,
        "price": price.toDouble(),
        "sizes": sizes,
        "images": images
      };
}
