class ProductModel {
  String? name;
  String? image;
  String? uId;
  String? category;
  String? subCategory;
  String? brand;
  String? size;
  double? price;
  int? quantity;

  ProductModel({
    this.name,
    this.image,
    this.category,
    this.subCategory,
    this.uId,
    this.brand,
    this.size,
    this.price,
    this.quantity,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    image = json['image'] as String?;
    brand = json['brand'] as String?;
    uId = json['uId'] as String?;
    category = json['category'] as String?;
    subCategory = json['subCategory'] as String?;
    size = json['size'] as String?;
    price = json['price'] as double?;
    quantity = json['quantity'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['image'] = image;
    json['category'] = category;
    json['subCategory'] = subCategory;
    json['uId'] = uId;
    json['brand'] = brand;
    json['size'] = size;
    json['price'] = price;
    json['quantity'] = quantity;
    return json;
  }
}
