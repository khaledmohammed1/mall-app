import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../seller_login_screen/login_screen.dart';

class ControlScreen extends StatelessWidget {

  const ControlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.to(()=> const LoginScreen());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text("Sign as Seller",style: TextStyle(color: Colors.white),),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: const Text("Sign as Buyer",style: TextStyle(color: Colors.white),
          ),
        ),
        ),
      ],
    ));
  }
}
