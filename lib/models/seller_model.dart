class SellerModel {
  String? username;
  String? email;
  String? phoneNumber;
  String? sellerId;
  List<Products>? products;

  SellerModel({
    this.username,
    this.email,
    this.phoneNumber,
    this.sellerId,
    this.products,
  });

  SellerModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String?;
    email = json['email'] as String?;
    phoneNumber = json['phoneNumber'] as String?;
    sellerId = json['sellerId'] as String?;
    products = (json['products'] as List?)
        ?.map((dynamic e) => Products.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['email'] = email;
    json['phoneNumber'] = phoneNumber;
    json['sellerId'] = sellerId;
    json['products'] = products?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Products {
  String? productName;
  String? productImage;
  String? brand;
  String? size;
  double? price;
  int? quantity;

  Products({
    this.productName,
    this.productImage,
    this.brand,
    this.size,
    this.price,
    this.quantity,
  });

  Products.fromJson(Map<String, dynamic> json) {
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
