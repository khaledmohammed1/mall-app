
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/seller_category_controller.dart';
import '../../widgets/category_item.dart';
import '../seller_add_product/sellerAddProductScreen.dart';
import '../seller_sub_category_screen/sub_cat_screen.dart';

CategoryController controller = Get.find();

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: controller.categories.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Center(
          child: GridView.count(
            shrinkWrap: true,
            childAspectRatio: 2 / 2,
            crossAxisCount: 2,
            physics: const BouncingScrollPhysics(),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(
              controller.categories.length,
                  (index) => CategoryItem(
                widget: controller.categories[index].name ==
                    "Accessories" ||
                    controller.categories[index].name ==
                        "Shoes" ||
                    controller.categories[index].name == "Clothes"
                    ? const SubCategoryScreen()
                    : SellerAddProductScreen(),
                onTap: () {
                  controller.changeCurrentCategory(
                    controller.categories[index].name!.toLowerCase(),
                  );
                  if (controller.categories[index].name ==
                      "Accessories" ||
                      controller.categories[index].name == "Shoes" ||
                      controller.categories[index].name ==
                          "Clothes") {
                    controller.getAllSubCategories(
                      controller.categories[index].name!
                          .toLowerCase(),
                    );
                  } else {
                    controller.currentSubCategory.value = '';
                  }
                  print(controller.currentCategory);
                  print(controller.currentSubCategory);
                },
                image: controller.categories[index].image!,
                name: controller.categories[index].name!,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
