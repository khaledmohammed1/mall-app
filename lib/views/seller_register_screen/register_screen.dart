import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/seller_auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_fom_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .01,
                left: MediaQuery.of(context).size.width * .01),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
      body: GetBuilder<AuthController>(
        init: Get.put(AuthController()),
        builder: (controller) => Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .02,
            right: MediaQuery.of(context).size.width * .05,
            left: MediaQuery.of(context).size.width * .05,
          ),
          child: Form(
            key: controller.registerFormKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    text: "Register New Account",
                    alignment: Alignment.center,
                    fontSize: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomTextFormField(
                    controller: controller.nameController,
                    text: " Name ",
                    hint: " Enter Name ",
                    onSave: (value) {},
                    validator: (value) {
                      if (controller.nameController.text.isEmpty) {
                        return "Enter Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    text: "Email",
                    hint: "Enter Email",
                    onSave: (value) {},
                    validator: (value) {
                      if (!controller.emailController.text.contains("@")) {
                        return "Enter Valid Email contains @";
                      }
                      if (controller.emailController.text.isEmpty) {
                        return "Enter Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomTextFormField(
                    keyBoardType: TextInputType.number,
                    controller: controller.phoneController,
                    text: " Phone Number ",
                    hint: "01*********",
                    onSave: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Number";
                      }
                      if (controller.phoneController.text.length != 11) {
                        return "Enter Valid Phone Number";
                      }
                      if (!value.startsWith("01")) {
                        return "Enter Phone Number starts with 01";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    controller: controller.passwordController,
                    text: "Password ",
                    hint: "Enter Password ",
                    onSave: (value) {},
                    validator: (value) {
                      if (controller.passwordController.text.isEmpty) {
                        return "Enter Password ";
                      }
                      if (controller.passwordController.text.length < 6) {
                        return "Enter Password at least 6 char";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    controller: controller.repeatPasswordController,
                    text: "Confirm Password",
                    hint: "Enter Confirm Password",
                    onSave: (value) {},
                    validator: (value) {
                      if (controller.repeatPasswordController.text.isEmpty) {
                        return "Enter Confirm Password";
                      }
                      if (controller.passwordController.text.length < 6) {
                        return "Enter Confirm Password at least 6 char";
                      }

                      if (controller.repeatPasswordController.text !=
                          controller.passwordController.text) {
                        return "Password and Confirm Password not identical";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  CustomButton(
                    onPressed: () {
                      controller.registerFormKey.currentState!.save();
                      if (controller.registerFormKey.currentState!.validate()) {
                        controller.register(
                          controller.nameController.text,
                          controller.phoneController.text.toString(),
                          controller.emailController.text,
                          controller.passwordController.text,
                        );
                      }
                    },
                    text: 'Register New Seller',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .025,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
