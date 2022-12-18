import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/sellProductController.dart';

class SellerEditProductScreen extends StatelessWidget {

  SellerEditProductScreen({Key? key}) : super(key: key);

  final SellProductController sellProductController =
  Get.put(SellProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Products Screen",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No image was selected"),
                              ),
                            );
                          }
                          if(image != null){

                          }
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "Add a New Image",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Product Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              // _buildTextFormField("Product Id"),
              Column(children: [
                _buildTextFormField("Product Name"),
                _buildTextFormField("Product Category"),
                _buildTextFormField("Price"),
                _buildTextFormField("Quantity"),
                _buildTextFormField("Size"),
                _buildTextFormField("Brand"),

                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ),
              ],)
            ],
          ),
        ),
      ),
    );
  }

}

TextFormField _buildTextFormField(String hintText) {
  return TextFormField(
    initialValue: "",
    decoration: InputDecoration(hintText: hintText),
  );
}
