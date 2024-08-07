import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/chekout_model.dart';



class CheckoutController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var tabIndex = 0.obs;
  final checkoutDetails = CheckoutDetails().obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    print("the tabs ${tabController.index}");
    tabController.addListener(_handleTabSelection);
  }

  void nextTab() {
    if (tabIndex.value < 2) {
      tabIndex.value++;
    }
    _handleTabSelection();
    print("working ${tabController.index}");
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
