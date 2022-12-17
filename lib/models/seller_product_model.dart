import 'dart:convert';


SellerProduct sellerProductFromJson(String str) => SellerProduct.fromJson(json.decode(str));

String sellerProductToJson(SellerProduct data) => json.encode(data.toJson());
class SellerProduct {
  final String name;
  final String imageUrl;
  final String brand;
  final String category;
  final String size;
  double price;
  double quantity;
  SellerProduct({
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.category,
    required this.size,
    required this.price,
    required this.quantity,
});
  factory SellerProduct.fromJson(Map<String, dynamic> json) => SellerProduct(
    name: json["name"],
    imageUrl: json["imageUrl"],
    brand: json["brand"],
    category: json["category"],
    size: json["size"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "brand": brand,
    "category": category,
    "size": size,
    "quantity": quantity,
    "price": price,

  };

  static List<SellerProduct> products =  [
    SellerProduct(
        name: "product1 ",
        category: "category 1",
        imageUrl:
            "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
        price: 10,
        quantity: 20, brand: '', size: '',
    ),
    SellerProduct(
        name: "product3 ",
        category: "category 3",

        imageUrl:
            "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
        price: 30.0,
        quantity:10, brand: '', size: '',
    ),
    SellerProduct(
        name: "product2 ",
        category: "category 2",
         imageUrl:
            "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
        price: 20.0,
        quantity: 35, brand: '', size: '',
    )
  ];
}
