import 'package:customer_ecommerce_app/views/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'helper/binding.dart';
import 'helper/catch_helper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: const Color.fromRGBO(51, 153, 255, .1),
      100: const Color.fromRGBO(51, 153, 255, .2),
      200: const Color.fromRGBO(51, 153, 255, .3),
      300: const Color.fromRGBO(51, 153, 255, .4),
      400: const Color.fromRGBO(51, 153, 255, .5),
      500: const Color.fromRGBO(51, 153, 255, .6),
      600: const Color.fromRGBO(51, 153, 255, .7),
      700: const Color.fromRGBO(51, 153, 255, .8),
      800: const Color.fromRGBO(51, 153, 255, .9),
      900: const Color.fromRGBO(51, 153, 255, 1),
    };
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff39A9DB, color),
      ),
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
   const MyApp({Key? key}) : super(key: key);
}
