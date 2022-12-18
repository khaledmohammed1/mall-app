import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.w400,
     this.color = Colors.black,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);
  final String text;
  final double fontSize;
  FontWeight fontWeight;
  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color),
      ),
    );
  }
}
