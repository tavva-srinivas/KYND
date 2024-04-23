import 'package:get/get.dart';

class Home_controller extends GetxController{
  static Home_controller get instance => Get.find();
  //In the Home_controller class uses Get.find() to obtain an instance of itself.
  // This approach is commonly used when you want to access the controller from
  // anywhere in the application without passing it explicitly.

  // obs --> making carousel_current_index --> observable
  final carousel_current_index = 0.obs;

  void update_page_indicator(index){
     carousel_current_index.value = index;
  }


}