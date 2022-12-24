import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_ecommerce_app/models/product_model.dart';
import 'package:customer_ecommerce_app/views/seller_add_product_control/seller_add_product_control.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../config/config.dart';
import '../helper/catch_helper.dart';

class SellProductController extends GetxController {
  String uid = CacheHelper.getData(key: "uid");
  SellProductController(){
    getSellerProduct();
  }
  var sellerProducts = <ProductModel>[].obs;
  ImagePicker picker = ImagePicker();
  var productImage = File("").obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

//Color Changing
  Future<void> getProductImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      productImage.value = File(pickedFile.path);
      Get.snackbar("Picking Image", "Image Posted Successfully !!!",
          backgroundColor: Color(0xFF308ad8).withOpacity(.7));
    } else {
      Get.snackbar(
        "Error",
        "Error while Posting image",
        backgroundColor: Color(0xFF308ad8).withOpacity(.5),
      );
    }
  }


  void createNewProduct({
    required String name,
    required String brand,
    required String size,
    required double price,
    required int quantity,
    required String category,
    required String userId,
    String? subCategory,
  }) async {
    FirebaseStorage.instance
        .ref()
        .child(
            "products/${Uri.file(productImage.value.path).pathSegments.last}")
        .putFile(productImage.value)
        .then(
      (value) {
        value.ref.getDownloadURL().then((value) {
          togglePostingProduct(
              category: category,
              subCategory: subCategory!,
              value: value,
              name: name,
              brand: brand,
              price: price,
              quantity: quantity,
              size: size,
              userId: userId);
          Get.snackbar('Product Posting', "Done",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kPrimaryColor,
              colorText: kBackgroundColor);
          Get.off(const SellerAddProductControlScreen());
          resetAllData();
        }).catchError(
          (onError) {
            print("error while posting product image");
          },
        );
      },
    ).catchError((h) {
      print("error while posting product");
    });
  }

  void getSellerProduct() async {
    await FirebaseFirestore.instance.collection("Seller").doc(uid).collection("Products").get().then(
          (value) {
            sellerProducts.value = [];
        for (var element in value.docs) {
          sellerProducts.add(ProductModel.fromJson(element.data()));
        }
        print("${sellerProducts.length} and worked");

          },
    ).catchError(
          (error) {
        print("error While getting Product");
      },
    );
  }

  void deleteSellerProduct(int index) {
    sellerProducts.removeAt(index);
  }


  void togglePostingProduct({
    required String category,
    required String subCategory,
    required String value,
    required String name,
    required String brand,
    required double price,
    required int quantity,
    required String size,
    required String userId,
  }) {
    if (subCategory == '') {
      FirebaseFirestore.instance
          .collection("Category")
          .doc(category)
          .collection("Products")
          .add(
            ProductModel(
              name: name,
              image: value,
              brand: brand,
              price: price,
              quantity: quantity,
              size: size,
            ).toJson(),
          );
      FirebaseFirestore.instance
          .collection("Seller")
          .doc(userId)
          .collection("Products")
          .add(
            ProductModel(
              name: name,
              image: value,
              brand: brand,
              price: price,
              quantity: quantity,
              size: size,
            ).toJson(),
          );
      print("Done");
    } else {
      FirebaseFirestore.instance
          .collection("Category")
          .doc(category)
          .collection("SubCategory")
          .doc(subCategory)
          .collection("Products")
          .add(
            ProductModel(
              name: name,
              image: value,
              brand: brand,
              price: price,
              quantity: quantity,
              size: size,
            ).toJson(),
          );
      FirebaseFirestore.instance
          .collection("Seller")
          .doc(userId)
          .collection("Products")
          .add(
            ProductModel(
              name: name,
              image: value,
              brand: brand,
              price: price,
              quantity: quantity,
              size: size,
            ).toJson(),
          );
    }
  }

  void resetAllData() {
    nameController.text = "";
    brandController.text = "";
    priceController.text = "";
    sizeController.text = "";
    quantityController.text = "";
  }
}
