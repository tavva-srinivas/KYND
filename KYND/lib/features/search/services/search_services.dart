import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kynd/features/admin/models/product.dart';
import 'package:kynd/features/search/models/product_search_summary.dart';

import '../../../Getx controllers/User_controller.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/devices_utils/device_util.dart';
import '../../../utils/error_handling.dart';
import 'package:http/http.dart' as http;

class Search_services{

  static Future<List<Product_summary>> get_search_products ({required BuildContext context, required String search}) async {
    User_provider user_provider = Get.find<User_provider>();

    List<Product_summary> my_products = [];
    http.Response response;

    // print("${Custom_text.url}/api/products?category:${category}");
    try{

      if(search.isEmpty){

        /// if there is no search show the trending products
          response = await http.get(
          Uri.parse("${Custom_text.url}/api/products/trending"),
          headers: {"Content-Type": "application/json", "auth-token": user_provider.user.token!},
        );

      }else {

        /// if there is a search string
        response = await http.get(
          Uri.parse("${Custom_text.url}/api/products/search/${search}"),
          headers: {
            "Content-Type": "application/json",
            "auth-token": user_provider.user.token!
          },
        );

      }

        print("body ${response.body}");

        final List<dynamic> productList = jsonDecode(response.body)['products'];
        print(productList.length);


        http_error_handling(res: response, context: context, on_success: (){
          for(int i =0;i< productList.length ;i++){
            print("in for ${jsonEncode(jsonDecode(response.body))}");
            my_products.add(Product_summary.from_json(productList[i]));
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