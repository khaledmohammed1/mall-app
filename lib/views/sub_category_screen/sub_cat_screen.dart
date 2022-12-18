import 'package:customer_ecommerce_app/views/seller_add_product/sellerAddProductScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/category_item.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sub-Category",
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
              2,
                  (index) => CategoryItem(image: 'assets/images/002-shopping-cart.png',name: "Male",widget: SellerAddProductScreen(),),
            ),
          ),
        ),
      ),
    );
  }
}

