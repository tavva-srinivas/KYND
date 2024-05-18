import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


/// controller for adding product page : selecting the chosen type of item and adding images
class DropdownController extends GetxController {
  Rx<String> selected_item = "Breakfast".obs;
  RxList<File> selectedImages = <File>[].obs;


  void set_selected(String value){
    selected_item.value = value;
  }

  void add_images(List<File> imgs){
    print("comming to the controler");
    selectedImages.addAll(imgs);
  }
}