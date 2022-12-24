import 'package:customer_ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sellProductController.dart';

SellProductController controller = Get.find();

class SellerDeleteProduct extends StatefulWidget {
  const SellerDeleteProduct({Key? key}) : super(key: key);

  @override
  State<SellerDeleteProduct> createState() => _SellerDeleteProductState();
}

class _SellerDeleteProductState extends State<SellerDeleteProduct> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading:
            InkWell(onTap:()=>Get.back(),child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,))
          ,
          centerTitle: true,
          title: const Text(
            "SellerDeleteProduct",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0.0,
        ),
        body: controller.sellerProducts.isEmpty
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => buildItem(context,controller.sellerProducts[index],index),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: controller.sellerProducts.length,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

Widget buildItem(context, ProductModel sellerProduct,int index) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    height: 200,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          sellerProduct.image!,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Container(
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sellerProduct.name!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    sellerProduct.price!.toString(),
                    style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                   controller.deleteSellerProduct(index);
                },
                color: Colors.red,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
