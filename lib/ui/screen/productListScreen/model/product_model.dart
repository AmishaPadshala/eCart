class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  int cartQuantity;

  ProductModel(
      {required this.id,
      required this.name,
        required this.imageUrl,
        required this.price,
        required this.cartQuantity});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: json["name"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      price: double.parse((json["price"] ?? "").toString()),
        cartQuantity: 0
    );
  }

}
