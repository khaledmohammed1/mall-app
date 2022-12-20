import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/seller_auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_fom_field.dart';
import '../seller_register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
        init: Get.put(AuthController()),
        builder: (controller) => Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * .05,
            right: MediaQuery.of(context).size.width * .05,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/4732442.jpg',
                      width: MediaQuery.of(context).size.width * .55,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Hello",
                            fontSize: 30,
                          ),
                          CustomText(
                            text: "Login to continue",
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => Get.to(const RegisterScreen()),
                        child: CustomText(
                          text: "Register new account",
                          fontSize: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    text: "Email ",
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
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    text: "Password",
                    hint: "Enter Password ",
                    onSave: (value) {},
                    validator: (value) {
                      if (controller.passwordController.text.isEmpty) {
                        return "Enter Password";
                      }
                      if (controller.passwordController.text.length < 6) {
                        return "Enter Password at least 6 char";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .06),
                  CustomButton(
                    text: "Login",
                    onPressed: () {
                      controller.loginFormKey.currentState!.save();
                      if (controller.loginFormKey.currentState!.validate()) {
                        controller.signIn(controller.emailController.text,controller.passwordController.text);
                      }
                    },
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
