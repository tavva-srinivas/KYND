import 'package:get/get.dart';
import 'package:kynd/features/admin/screens/Admin_products_screen.dart';
import 'package:kynd/features/admin/screens/Analytics_screen.dart';
import 'package:kynd/features/admin/screens/orders_screen.dart';

class Admin_nav_controller extends GetxController{

   final Rx<int> selected_index = 0.obs;

   /// all the screens in admin side
   final screens = [Admin_products(),In_orders_screen(), Analytics()];

}