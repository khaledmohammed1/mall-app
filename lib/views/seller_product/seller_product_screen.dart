import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sellProductController.dart';
import '../../models/seller_product_model.dart';
import '../seller_add_product/sellerAddProductScreen.dart';


class SellerProductScreen extends StatelessWidget {

  SellerProductScreen({Key? key}) : super(key: key);

  final SellProductController sellProductController =
      Get.put(SellProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Products Screen"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => SellerAddProductScreen());
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Add a New Product",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: sellProductController.products.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => SizedBox(
                        height: 300,
                        child: SellerProductCard(
                          product: sellProductController.products[index],
                          index: index,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SellerProductCard extends StatelessWidget {
  final SellerProduct product;
  final int index;

  SellerProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  final SellProductController sellProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SizedBox(
                  height: 190,
                  width: 190,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text("DELETE"),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.red,)),
                  ],
                )
                // Column(
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         const SizedBox(
                //           width: 40,
                //           child: Text(
                //             "Price",
                //             style: TextStyle(
                //                 fontSize: 12, fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //         // SizedBox(
                //         //     width: 200,
                //         //     child: Slider(
                //         //       value: product.price,
                //         //       onChanged: (value) {
                //         //         sellProductController.updateProductPrice(
                //         //             index, product, value);
                //         //       },
                //         //       min: 0,
                //         //       max: 100,
                //         //       divisions: 10,
                //         //       activeColor: Colors.black,
                //         //       inactiveColor: Colors.black12,
                //         //     )),
                //         SizedBox(
                //           width: 40,
                //           child: Text(
                //             "EG ${product.price.toStringAsFixed(1)}",
                //             style: const TextStyle(
                //                 fontSize: 10, fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         const SizedBox(
                //           width: 40,
                //           child: Text(
                //             "Qty.",
                //             style: TextStyle(
                //                 fontSize: 12, fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //         SizedBox(
                //             width: 200,
                //             child: Slider(
                //               value: product.quantity,
                //               onChanged: (value) {
                //                 sellProductController.updateProductQuantity(
                //                     index, product, value);
                //               },
                //               min: 0,
                //               max: 100,
                //               divisions: 10,
                //               activeColor: Colors.black,
                //               inactiveColor: Colors.black12,
                //             )),
                //         SizedBox(
                //           width: 40,
                //           child: Text(
                //             product.quantity.toStringAsFixed(1),
                //             style: const TextStyle(
                //                 fontSize: 10, fontWeight: FontWeight.bold),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
