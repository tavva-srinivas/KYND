import 'dart:convert';
import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/admin_bottom_nav.dart';
import 'package:kynd/features/admin/admin_controller/admin_products_controller.dart';
import 'package:kynd/features/admin/models/product.dart';
import 'package:kynd/utils/constants/text_strings.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:http/http.dart' as http;

import '../../../Getx controllers/User_controller.dart';
import '../../../utils/error_handling.dart';

class Admin_services{

   static void sell_Product({
     required BuildContext context,
     required String name,
     required String description,
     required int price,
     // like break fast or lunch or snack
     required String category,
     required int quantity,
     required List<File> images,

     /// Nutrition
     required int serving,
     required int protein,
     required int calcium,
     required int calories,
     required int fibre,
}) async{
     User_provider user_provider = Get.find<User_provider>();
     try{
       final cloudinary = CloudinaryPublic('dczkxl7th', 'fvqdpco1');
       print("comming to admin  services");

       List<String> image_urls = [];
       print("the images length ${images.length} and ${name}");

       /// for checking if the person added the same Product
       http.Response response = await http.post(Uri.parse("${Custom_text.url}/admin/check_product"),
         headers: {"Content-Type":"application/json",
           "auth-token" : user_provider.user.token!
         },
         body: jsonEncode({
            'name': name
         }),
       );
       print("the status code ${response.statusCode}");
       print(response.body);

       // this means that he is not adding the Product again
       http_error_handling(res: response, context: context, on_success: () async{
         print("the Product is new");
         for (int i = 0; i < images.length; i++) {
           print(images[i].path);
                 try{
                   CloudinaryResponse response = await cloudinary.uploadFile(
                       CloudinaryFile.fromFile(
                           images[i].path, resourceType: CloudinaryResourceType.Image,
                           folder: name));
                   print("the image is ${response}");
                   image_urls.add(response.secureUrl);
                 }catch(error){
                   print("error ${error}");
                 }

         }
         print("12");
         print("the  ${image_urls.length}");
         print("the user ${user_provider.user.id}");

         /// creating the Product class
         Product product = Product(name: name,
             description: description,
             quantity: quantity,
             price: price,
             images: image_urls,
             category: category,
             owner_id: user_provider.user.id
         );


         /// The Product data should be imported to the database
         /// adding Product
         http.Response response = await http.post(
           Uri.parse("${Custom_text.url}/admin/add_product"),
           headers: {"Content-Type": "application/json"},
           body: jsonEncode(product.toJson()),
         );
         print(response.body);
         print(response.statusCode);

         http_error_handling(
             res: response, context: context, on_success: () async {
           print("comming to error handling");
           Device_util.showSnackbar(context, "Product successfully added");
           Navigator.pushNamedAndRemoveUntil(
               context, Admin_bottom_nav.route_name, (route) => false);
         });

       });

     }catch(error){
       print("error in admin services ${error}");
       Device_util.showSnackbar(context,error.toString());
     }
   }



   ///for getting all the products
   static Future<List<Product>> get_products({required BuildContext context})async {

     User_provider user_provider = Get.find<User_provider>();
     List<Product> my_products = [];
     try{
       http.Response response = await http.get(Uri.parse("${Custom_text.url}/admin/get_products"),
         headers: {"Content-Type":"application/json", "auth-token" : user_provider.user.token! },
       );

       print(response.body);
       print("the images are ${response.body.length}");

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
       print("error in admin services ${error}");
       Device_util.showSnackbar(context,error.toString());
     }
     return my_products;
   }
   /// complete of get_products





/// to delete a p<roduct
   static Future<void> delete_product({required BuildContext context, required String id}) async {
     User_provider userProvider = Get.find<User_provider>();
     Admin_product_controller adminController = Get.find<Admin_product_controller>();

     try {
       http.Response response = await http.delete(
         Uri.parse("${Custom_text.url}/admin/delete_product"),
         headers: {"Content-Type": "application/json", "auth-token": userProvider.user.token!},
         body: jsonEncode({
           '_id': id,
         }),
       );

       print(response.body);

       if (response.statusCode == 200) {

         http_error_handling(res: response, context: context,on_success: (){
           // Remove the deleted Product from the list in the controller
           adminController.myProducts!.removeWhere((product) => product.id == id);
         Device_util.showSnackbar(context, "Deleted Successfully");
         });
       }
     } catch (error) {
       print("error in admin services $error");
       Device_util.showSnackbar(context, error.toString());
     }
   }

/// completion of delete Product







    }





// code from flutter dev for cloudinary
/*

CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path, resourceType: CloudinaryResourceType.Image),
    );
    
    print(response.secureUrl);
 */