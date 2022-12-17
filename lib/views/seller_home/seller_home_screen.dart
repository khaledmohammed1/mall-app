import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../seller_product/seller_product_screen.dart';
import '../splash/splash_screen.dart';



class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Seller Home"),
          backgroundColor: Colors.black,
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
                    Get.to(() => SellerProductScreen());
                  },
                  child: const Card(
                    child: Center(child: Text("Go To Products"),),
                  ),
                ),),
              Container(width: double.infinity,
                height: 150,
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
