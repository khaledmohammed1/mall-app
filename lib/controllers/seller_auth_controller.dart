import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/config.dart';
import '../helper/catch_helper.dart';
import '../views/seller_home/seller_home_screen.dart';
import '../views/splash/splash_screen.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  User? get userProfile => auth.currentUser;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var isSignedIn = false.obs;

  void register(
      String name, String phoneNumber, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseFirestore.instance
            .collection("Seller")
            .doc(value.user!.uid)
            .set({
          "name": name,
          "phoneNumber": phoneNumber.toString(),
          "email": email,
        }).then(
          (value) => Get.snackbar(
            "Register Success",
            "Register New Seller Successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kPrimaryColor,
            colorText: kBackgroundColor,
          ),
        );
      });
      update();
      Get.offAll(() => const SplashScreen());
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = ('The account already exists for that email.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kPrimaryColor,
          colorText: kBackgroundColor);
    } catch (e) {
      Get.snackbar('Error occured!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kPrimaryColor,
          colorText: kBackgroundColor);
    }
  }

  void signIn(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User userdata = FirebaseAuth.instance.currentUser!;
        CacheHelper.setData(key: 'uid', value: userdata.uid);
        String? UID = CacheHelper.getData(key: "uid");
        print(UID);
      });
      Get.offAll(() => const SellerHomeScreen());
      update();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;

      String message = '';

      if (e.code == 'wrong-password') {
        message = 'Invalid Password. Please try again!';
      } else if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kPrimaryColor,
          colorText: kBackgroundColor);
    } catch (e) {
      Get.snackbar(
        'Error occurred!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kPrimaryColor,
        colorText: kBackgroundColor,
      );
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      CacheHelper.remove('uid');
      isSignedIn.value = false;
      update();
      Get.offAll(() => const SplashScreen());
    } catch (e) {
      Get.snackbar('Error occurred!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kPrimaryColor,
          colorText: kBackgroundColor);
    }
  }
}
