import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/product.dart';

class Admin_product_controller extends GetxController {

  RxList<Product>? myProducts = RxList<Product>();
  RxBool isLoading = true.obs; // Observable boolean to track loading state



  void setProducts(List<Product>? products) {
    if (products != null) {
      myProducts!.clear(); // Clear existing products
      myProducts = RxList<Product>.from(products); // Convert to RxList
      isLoading.value = false; // Set loading to false after data is fetched
    }
  }



}
