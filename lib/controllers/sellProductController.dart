
import 'package:get/get.dart';

import '../models/seller_product_model.dart';

class SellProductController extends GetxController {
  List<SellerProduct> products = SellerProduct.products.obs;
  void updateProductPrice(
    int index,
      SellerProduct product,
      double value,
      ){
      product.price = value;
      products[index] = product;
  }
  void updateProductQuantity(
    int index,
      SellerProduct product,
      double value,
      ){
      product.quantity = value;
      products[index] = product;
  }
}