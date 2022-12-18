import 'package:customer_ecommerce_app/views/sub_category_screen/sub_cat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';
import '../../widgets/category_item.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init:CategoryController() ,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Category",
            ),
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: 2/2,
                crossAxisCount: 2,
                physics: const BouncingScrollPhysics(),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(
                  controller.categoriesIcons.length,
                      (index) => CategoryItem(image: controller.categoriesIcons[index],name: controller.categoriesStrings[index],widget:  const SubCategoryScreen(),),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}


