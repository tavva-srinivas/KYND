import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kynd/features/admin/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:kynd/features/home/controllers.home/category_prod_controller.dart';
import '../../../Getx controllers/User_controller.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/devices_utils/device_util.dart';
import '../../../utils/error_handling.dart';

class Home_services{

  static Future<List<Product>> get_category_prod({required BuildContext context,required String category}) async {

    User_provider user_provider = Get.find<User_provider>();

    List<Product> my_products = [];

    print("${Custom_text.url}/api/products?category:${category}");


    try{
      http.Response response = await http.get(
        Uri.parse("${Custom_text.url}/api/products?category=${category}"),
        headers: {"Content-Type": "application/json", "auth-token": user_provider.user.token!},
      );

      print("object");

      print("body ${response.body}");

      final List<dynamic> productList = jsonDecode(response.body)['products'];
      print(productList.length);



      http_error_handling(res: response, context: context, on_success: (){
        for(int i =0;i< productList.length ;i++){
          print("in for ${jsonEncode(jsonDecode(response.body))}");
          my_products.add(Product.fromJson(productList[i]));
        }
      });

      print("the length ${productList.length}");

    }catch(error){
      print("error in Home services ${error}");
      Device_util.showSnackbar(context,error.toString());
    }
    return my_products;
  }
}