import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.image, required this.name,required this.widget}) : super(key: key);

  final String image;
  final String name;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(()=> widget);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,width: 70,),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
