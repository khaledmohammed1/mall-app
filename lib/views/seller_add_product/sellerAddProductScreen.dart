import 'package:customer_ecommerce_app/controllers/seller_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sellProductController.dart';
import '../../controllers/seller_category_controller.dart';
import '../../helper/catch_helper.dart';

class SellerAddProductScreen extends StatelessWidget {
  SellerAddProductScreen({Key? key}) : super(key: key);

  final SellProductController sellProductController =
      Get.put(SellProductController());
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellProductController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Add Products Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: Theme.of(context).primaryColor,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              sellProductController.getProductImage();
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Add a New Image",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Product Information",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  // _buildTextFormField("Product Id"),
                  Column(
                    children: [
                      _buildTextFormField(
                        "Product Name",
                        controller: sellProductController.nameController,
                      ),
                      _buildTextFormField(
                        "Price",
                        controller: sellProductController.priceController,
                      ),
                      _buildTextFormField(
                        "Quantity",
                        controller: sellProductController.quantityController,
                      ),
                      _buildTextFormField(
                        "Size",
                        controller: sellProductController.sizeController,
                      ),
                      _buildTextFormField("Brand",
                          controller: sellProductController.brandController),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            sellProductController.createNewProduct(
                              name: sellProductController.nameController.text,
                              brand: sellProductController.brandController.text,
                              size: sellProductController.sizeController.text,
                              price: double.parse(
                                sellProductController.priceController.text,
                              ),
                              quantity: int.parse(
                                sellProductController.quantityController.text,
                              ),
                              category: categoryController.currentCategory.value,
                              subCategory:
                                  categoryController.currentSubCategory.value,
                              userId: CacheHelper.getData(key: "uid"),
                            );
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

TextFormField _buildTextFormField(
  String hintText, {
  required TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
  );
}
