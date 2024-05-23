import 'package:get/get.dart';

class ListController extends GetxController {
  RxList<String> items;

  ListController(List<String> initialItems) : items = initialItems.obs;

  void reorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }
}
