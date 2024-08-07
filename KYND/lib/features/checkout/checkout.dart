import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/features/checkout/checkout_tabs/Time_selection.dart';
import 'package:kynd/features/checkout/checkout_tabs/payments_page.dart';

import 'checkout_tabs/location.dart';
import 'controllers/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  final CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          title: Text(
            "Checkout",
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(36),
            child: TabBar(
              indicatorWeight: 0,
              dividerHeight: 0,
              indicatorPadding: EdgeInsets.all(4),
              padding: EdgeInsets.symmetric(horizontal: 12),
              dividerColor: Colors.deepOrangeAccent,
              onTap: (index) => {checkoutController.prevTab(index)},
              controller: checkoutController.tabController,
              physics: const NeverScrollableScrollPhysics(), // Disable user interaction
              unselectedLabelColor: Colors.redAccent,
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent, Colors.orangeAccent],
                ),
                borderRadius: BorderRadius.circular(30),
                color: Colors.redAccent,
              ),
              tabs: [
                Tab(
                  child: Icon(Icons.location_on, size: 28),
                ),
                Tab(
                  child: Icon(Icons.access_time, size: 28),
                ),
                Tab(
                  icon: Icon(Icons.restaurant_outlined, size: 27),
                ),
              ],
            ),
          ),
        ),
        body:  TabBarView(
            controller: checkoutController.tabController,
            physics: NeverScrollableScrollPhysics(), // Disable swiping
            children: [
              Location_capture(),
              Time_selection(),
              Payments_screen(),
            ],
          )
        // If you want to add the floating action button logic later, you can add it here.
      ),
    );
  }
}


