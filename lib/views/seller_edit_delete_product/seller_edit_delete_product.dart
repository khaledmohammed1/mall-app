import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../seller_edit_screen/seller_edit_screen.dart';

class SellerEditAndDeleteProduct extends StatelessWidget {
  const SellerEditAndDeleteProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "SellerEditAndDeleteProduct",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Padding(
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
                  itemBuilder: (context, index) => buildItem(context),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildItem(context) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    height: 200,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          "https://images.freeimages.com/vhq/images/previews/92a/clouds-07-144703.png",
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
                    "Product 1",
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
                    "EG 10.00",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Get.to(()=>SellerEditProductScreen());
                    },
                    color: Colors.white,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
