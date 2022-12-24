import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../control/control_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () =>
        Get.offAll(()=> ControlScreen()));
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children:  [
         Center(
          child: Image(
            image: const AssetImage("assets/images/4732442.jpg"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
          ),
        ),

      ],
    ));
  }
}
