import 'package:customer_ecommerce_app/views/seller_category_screen/category_screen.dart';
import 'package:customer_ecommerce_app/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../seller_delete_product/seller_delete_product.dart';

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
              height: 140,
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
              height: 140,
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child
                  : InkWell(
                onTap: (){
                  Get.to(() => const SellerDeleteProduct());
                },
                child: const Card(
                  child: Center(child: Text("Delete Products"),),
                ),
              ),),
            Container(width: double.infinity,
              height: 140,
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child
                  : InkWell(
                onTap: (){
                  Get.offAll(() => const SplashScreen());
                },
                child: const Card(
                  child: Center(child: Text("Logout"),),
                ),
              ),),
          ],
        ),
      ),
    );
  }
}


