import 'package:customer_ecommerce_app/controllers/sellProductController.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SellProductController());
  }

}