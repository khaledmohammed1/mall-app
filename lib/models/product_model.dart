class ProductModel {
  String? productName;
  String? productImage;
  String? brand;
  String? size;
  double? price;
  int? quantity;

  ProductModel({
    this.productName,
    this.productImage,
    this.brand,
    this.size,
    this.price,
    this.quantity,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['productName'] as String?;
    productImage = json['ProductImage'] as String?;
    brand = json['brand'] as String?;
    size = json['size'] as String?;
    price = json['price'] as double?;
    quantity = json['quantity'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['productName'] = productName;
    json['ProductImage'] = productImage;
    json['brand'] = brand;
    json['size'] = size;
    json['price'] = price;
    json['quantity'] = quantity;
    return json;
  }
}
