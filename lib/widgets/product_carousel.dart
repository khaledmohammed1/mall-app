// import 'package:flutter/material.dart';
//
// import '../models/models.dart';
// import 'product_card.dart';
//
// class ProductCarousel extends StatelessWidget {
//   final List<Product> products;
//
//   const ProductCarousel({
//     Key? key,
//     required this.products,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: SizedBox(
//         height: 165,
//         child: ListView.builder(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//           physics: const BouncingScrollPhysics(),
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 8.0, top: 8.0),
//               child: ProductCard(product:products[index],),
//             );
//           },
//           scrollDirection: Axis.horizontal,
//           itemCount: products.length,
//           shrinkWrap: true,
//         ),
//       ),
//     );
//   }
// }
