import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../admin/models/product.dart';


class Category_prod_controller extends GetxController {

  RxList<Product>? category_products = RxList<Product>();
  RxBool isLoading = true.obs; // Observable boolean to track loading state



  void setProducts(List<Product>? products) {
    if (products != null) {
      category_products!.clear(); // Clear existing products
      category_products = RxList<Product>.from(products); // Convert to RxList
      isLoading.value = false; // Set loading to false after data is fetched
    }
  }



}
