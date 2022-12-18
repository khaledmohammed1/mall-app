import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.text,
      required this.hint,
      required this.onSave,
      this.validator,
      this.obscureText = false,
      this.keyBoardType = TextInputType.text,
      this.alignment = Alignment.topLeft,
      required this.controller})
      : super(key: key);

  final String text;
  final String hint;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  TextInputType keyBoardType;
  final Alignment alignment;
  TextEditingController controller;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          alignment: alignment,
          text: text,
          fontSize: 14,
          color: Colors.grey.shade800,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyBoardType,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
