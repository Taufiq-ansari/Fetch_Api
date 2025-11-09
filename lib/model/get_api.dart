class Products {
  List<ProductsItems> items = [];
}

class ProductsItems {
  String title;
  String description;
  List<String> images;
  double price;

// constructor
  ProductsItems({
    required this.title,
    required this.description,
    required this.images,
    required this.price,
  });

  factory ProductsItems.fromJson(Map<String, dynamic> json) {
    return ProductsItems(
      title: json["title"],
      description: json["description"],
      images: List<String>.from(json["images"]),
      price: json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "images": images,
      "price": price,
    };
  }
}
