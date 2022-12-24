import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/catch_helper.dart';
import '../seller_home/seller_home_screen.dart';
import '../seller_login_screen/login_screen.dart';

// ignore: must_be_immutable
class ControlScreen extends StatelessWidget {

   ControlScreen({Key? key}) : super(key: key);
  String? uid = CacheHelper.getData(key: "uid");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.to(()=>  uid==null?const LoginScreen():const SellerHomeScreen());
            },
            child: const Text("Sign as Seller",style: TextStyle(color: Colors.white),),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
            },
            child: const Text("Sign as Buyer",style: TextStyle(color: Colors.white),
          ),
        ),
        ),
      ],
    ));
  }
}
