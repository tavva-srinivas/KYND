import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  var tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabSelection);
  }

  void nextTab() {
    if (tabIndex.value < 2) {
      tabIndex.value++;
    }
    _handleTabSelection();
  }

  void _handleTabSelection() {
    tabController.index = tabIndex.value;
  }

  void prevTab(int index) {
    if (index < tabIndex.value) {
      tabIndex.value = index;
    }
    _handleTabSelection();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
