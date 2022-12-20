class ProductModel {
  String? name;
  String? image;
  String? brand;
  String? size;
  double? price;
  int? quantity;

  ProductModel({
    this.name,
    this.image,
    this.brand,
    this.size,
    this.price,
    this.quantity,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    image = json['image'] as String?;
    brand = json['brand'] as String?;
    size = json['size'] as String?;
    price = json['price'] as double?;
    quantity = json['quantity'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['image'] = image;
    json['brand'] = brand;
    json['size'] = size;
    json['price'] = price;
    json['quantity'] = quantity;
    return json;
  }
}
