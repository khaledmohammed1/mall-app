import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/seller_category_controller.dart';
import '../../widgets/category_item.dart';
import '../seller_add_product/sellerAddProductScreen.dart';

CategoryController controller = Get.find();

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
        InkWell(onTap:()=>Get.back(),child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,))
        ,
        centerTitle: true,
        title: const Text(
          "Sub Category",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: controller.subCategories.isEmpty
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : GridView.count(
            shrinkWrap: true,
            childAspectRatio: 2 / 2,
            crossAxisCount: 2,
            physics: const BouncingScrollPhysics(),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: List.generate(
              controller.subCategories.length,
                  (index) => CategoryItem(
                widget: SellerAddProductScreen(),
                onTap: () {
                  controller.changeCurrentSubCategory(
                    controller.subCategories[index].name!
                        .toLowerCase(),
                  );
                  print(controller.currentCategory);
                  print(controller.currentSubCategory);
                },
                image: controller.subCategories[index].image!,
                name: controller.subCategories[index].name!,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
