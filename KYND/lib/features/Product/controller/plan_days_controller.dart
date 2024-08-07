import 'package:get/get.dart';

class Plan_days_controller extends GetxController {
  var appetite_level = 1.obs;

  final selectedIndex = 1.obs; // Initially, the center button (1 week) is selected

  final menu = [
    'Paneer Paratha',
    'Oats with Fruits',
    'Chicken',
    'Millets Idly',
    'Paneer Paratha',
    'Oats with Fruits',
    'Chicken',
    'Oats with Fruits',
    'Chicken',
    'Millets Idly',
    'Paneer Paratha',
    'Oats with Fruits',
    'Chicken',
    'Paneer Paratha',
  ].obs;

  final selected_week_dot = 1.obs; // Initially, the first dot is active




  /// for changing the apetite level
   void update_slider_value(int new_value){
    appetite_level.value = new_value;
   }


   /// for changing the page when swipe left and right
   void toggle_dot_left(){
     if(selected_week_dot.value < 2){
       selected_week_dot.value ++;
     }
   }

   void toggle_dot_right(){
     if(selected_week_dot.value > 1){
       selected_week_dot.value --;
     }
   }



  // void toggleDot() {
  // isFirstDotActive.toggle(); // Toggle the active dot
  // }

  void updateSelectedIndex(int index) {
     print("the value is ${selectedIndex.value}");
  selectedIndex.value = index;
  selected_week_dot.value = 1;
     print("the value is ${selectedIndex.value}");
  }

  void reorderMenu(int oldIndex, int newIndex) {
  if (oldIndex < newIndex) {
  newIndex -= 1;
  }
  // Remove the item from the old position and insert it at the new position
  final tile = menu.removeAt(oldIndex);
  menu.insert(newIndex, tile);
  }


}
