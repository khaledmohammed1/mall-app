import 'package:customer_ecommerce_app/views/seller_add_product/sellerAddProductScreen.dart';
import 'package:customer_ecommerce_app/views/seller_category_screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../seller_edit_delete_product/seller_edit_delete_product.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Seller App",
          style: TextStyle(color: Colors.white),

        ),
        elevation: 0.0,
      ),
      body: SizedBox(
        child: Column(
          children: [
            Container(width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child
                  : InkWell(
                onTap: (){
                  Get.to(() => const CategoryScreen());
                },
                child: const Card(
                  child: Center(child: Text("Add New Product"),),
                ),
              ),),
            Container(width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child
                  : InkWell(
                onTap: (){
                  Get.to(() => const SellerEditAndDeleteProduct());
                },
                child: const Card(
                  child: Center(child: Text("Edit or Delete Products"),),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}


