import 'package:get/get.dart';

class Home_controller extends GetxController{
  static Home_controller get instance => Get.find();

  // obs --> making carousel_current_index --> observable
  final carousel_current_index = 0.obs;

  void update_page_indicator(index){
     carousel_current_index.value = index;
  }


}