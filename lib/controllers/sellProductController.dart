import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_ecommerce_app/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/seller_product_model.dart';

class SellProductController extends GetxController {
  List<SellerProduct> products = SellerProduct.products.obs;

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

  void updateProductPrice(
      int index,
      SellerProduct product,
      double value,
      ) {
    product.price = value;
    products[index] = product;
  }

  void updateProductQuantity(
      int index,
      SellerProduct product,
      double value,
      ) {
    product.quantity = value;
    products[index] = product;
  }

  void createNewProduct({
    required String name,
    required String brand,
    required String size,
    required double price,
    required int quantity,
    required String category,
    String? subCategory,
  }) {
    FirebaseStorage.instance
        .ref()
        .child(
        "products/${Uri.file(productImage.value.path).pathSegments.last}")
        .putFile(productImage.value)
        .then(
          (value) {
        value.ref.getDownloadURL().then((value) {
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
          print("Done");
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
}
