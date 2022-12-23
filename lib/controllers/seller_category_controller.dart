import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/cat_model.dart';
import '../models/product_model.dart';

class CategoryController extends GetxController {
  CategoryController() {
    getAllCategories();
  }
  RxString currentCategory="".obs;
  RxString currentSubCategory="".obs;
  var categories = <CategoryModel>[].obs;
  var subCategories = <CategoryModel>[].obs;
  List<ProductModel> products = [];
  void getAllCategories() {
    FirebaseFirestore.instance.collection("Category").get().then(
          (value) {
        categories.value = [];
        for (var element in value.docs) {
          categories.add(CategoryModel.fromJson(element.data()));
        }
      },
    ).catchError(
          (error) {
        print("error While getting Categories");
      },
    );
  }
  void changeCurrentCategory(String category){
    currentCategory.value=category;
  }
  void changeCurrentSubCategory(String subCategory){
    currentSubCategory.value=subCategory;
  }
  void getAllSubCategories(String category) {
    FirebaseFirestore.instance
        .collection("Category")
        .doc(category)
        .collection("SubCategory")
        .get()
        .then(
          (value) {
        subCategories.value = [];
        for (var element in value.docs) {
          subCategories.add(CategoryModel.fromJson(element.data()));
        }
      },
    ).catchError(
          (error) {
        print("error While getting SubCategories");
      },
    );
  }
  void reset(){
    currentCategory.value='';
    currentSubCategory.value='';
    update();
  }
}
