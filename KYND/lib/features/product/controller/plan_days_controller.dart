import 'package:get/get.dart';

class Plan_days_controller extends GetxController {
  RxList<String> items;

  Plan_days_controller(List<String> initialItems) : items = initialItems.obs;

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }
}
