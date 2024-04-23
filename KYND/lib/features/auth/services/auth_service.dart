// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:kynd/utils/constants/text_strings.dart';
// import 'package:kynd/utils/devices_utils/device_util.dart';
// import 'package:kynd/utils/error_handling.dart';
//
// class Auth_service{
//
//   static Future<void> signup_user({required BuildContext context, required String first_name, required String last_name, required phone_number, required address, required email, required password}) async {
//     try{
//       print("Coming to auth_services");
//       http.Response response = await http.post(Uri.parse("${Custom_text.url}/api/signup"),body:  {
//         'name': "${last_name} ${first_name}",
//         'phone_number': phone_number,
//         'address': address,
//         'email': email,
//         'password': password
//       },headers: <String,String>{
//         'Content-Type' : 'application/json; charset=UTF-8'
//       }
//       );
//       print(response.statusCode);
//       http_error_handling(res: response, context: context, on_success: (){
//         Device_util.showSnackbar(context, "Account created!");
//         // need to login with same credentials
//       });
//     } catch(error){
//       Device_util.showSnackbar(context, error.toString());
//       print("error in auth_services ${error}");
//     }
//   }
// }


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kynd/Getx%20controllers/provider.dart';
import 'package:kynd/bottom_nav.dart';
import 'package:kynd/admin_bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/devices_utils/device_util.dart';
import '../../../utils/error_handling.dart'; // Import dart:convert library

class Auth_service {

  static Future<void> signup_user({required BuildContext context, required String first_name, required String last_name, required phone_number, required address, required email, required password}) async {
    try {

      // Serialize the request body to JSON
      var requestBody = {
        'name': "$first_name $last_name",
        'phone_number': phone_number,
        'address': address,
        'email': email,
        'password': password
      };

      print(requestBody);

      print("Coming to auth_services");
      print("${Custom_text.url}/api/signup");

      http.Response response = await http.post(
          Uri.parse("${Custom_text.url}/api/signup"),
          body:jsonEncode(requestBody) , // Use the serialized JSON body
        headers: {"Content-Type":"application/json"},
      );

      print(response.statusCode);

      print("reaching here");
      http_error_handling(res: response, context: context, on_success: (){
        Device_util.showSnackbar(context, "Account created!");

        // need to login with same credentials
        Auth_service.signin_user(context: context, email: email, password: password);
      });
    } catch(error) {
      Device_util.showSnackbar(context, error.toString());
      print("error in auth_services $error");
    }
  }



  static Future<void> signin_user({required BuildContext context, required email, required password}) async {
    try {
      print("${Custom_text.url}/api/signin");

      print("email is $email $password");

      http.Response response = await http.post(
        Uri.parse("${Custom_text.url}/api/signin"),
        body:jsonEncode({
          'email':email,
          'password' : password
        }) , // Use the serialized JSON body
        headers: {"Content-Type":"application/json"},
      );

      print(response.statusCode);
      print(response.body);

      print("decoded -> ${jsonDecode(response.body)} , type : ${jsonDecode(response.body).runtimeType}");

      print("type of response body ${response.body.runtimeType}");


      http_error_handling(res: response, context: context, on_success:  () async {
           SharedPreferences prefs = await SharedPreferences.getInstance();
           print("reachin login");

           User_provider userProvider = Get.put(User_provider()); // Register UserProvider
           userProvider.set_user(response.body); // Set user data

           if(userProvider.user.type == "user"){
             Navigator.pushNamedAndRemoveUntil(context, Bottom_nav.route_name, (route) => false);
           }
           else{
             Navigator.pushNamedAndRemoveUntil(context, Admin_bottom_nav.route_name, (route) => false);
           }


           try {
             final bool saved = await prefs.setString("auth-token", jsonDecode(response.body)["jwt_token"]);
             print("shared saved is $saved");
           } catch (error) {
             print("Error saving token: $error");
           }

      });
    } catch(error) {

      Device_util.showSnackbar(context, error.toString());
      print("error in auth_services $error");
    }
  }




   static Future<void> get_user_data ({required BuildContext context}) async {
    try {
       SharedPreferences preferences = await SharedPreferences.getInstance();
       String? token = preferences.getString('auth-token');

       if(token == null) {
         preferences.setString('auth-token', '');
       }

       // Now make a post request
      http.Response tokenValidity = await http.post(Uri.parse("${Custom_text.url}/token_isvalid"),
        headers: {"Content-Type":"application/json",
                  "auth-token" : token!
        },
      );

       var isValid = jsonDecode(tokenValidity.body);

       print("is valid $isValid");

       /// irrespective of token present or not i am creating instance of user_provider
       /// instantiate user provider
       User_provider userProvider = Get.put(User_provider());


       if(isValid){
         print(token);
         /// get the user data
         http.Response userRes = await http.get(Uri.parse("${Custom_text.url}/"),
           headers: {"Content-Type":"application/json",
             "auth-token" : token
           },
         );

         print(" comming to ${userRes.body}");

         userProvider.set_user(userRes.body);
         print("email ${userProvider.user.email}");
       }

       print("completed get_user_data");
    } catch(error) {

      Device_util.showSnackbar(context, error.toString());
      print("error in auth_services $error");
    }
  }



}
