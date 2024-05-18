import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/circular_container.dart';
import 'package:kynd/features/product_review/screens/product_review.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:kynd/widgets/helper_to_product_card/shadow_product_card.dart';

import '../features/admin/screens/helper_to_screens/product_details.dart';
import '../features/admin/screens/helper_to_screens/rupee_price.dart';
import '../utils/constants/colors.dart';
import 'helper_to_product_card/product_title_text.dart';


class Product_card_vertical extends StatelessWidget {
  const Product_card_vertical({super.key,
     this.has_brand = false,
     this.has_like = true,
     this.discount = 10,
    this.icon = Iconsax.add,
    required this.price,
    required this.name,
    required this.image,
    required this.id

  });

  final bool has_brand;
  final bool has_like;
  final int discount;
  final IconData icon;
  final String name;
  final int price;
  final String image;
  final String id;
  // final VoidCallback ontap;






  @override
  Widget build(BuildContext context) {
    final dark = Device_util.is_dark_mode(context);

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Product_review.route_name,arguments: id);
      },
      child: Container(
        width: Device_util.get_width(context) *0.5 ,
        height: Device_util.get_height(context)*0.4,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
           boxShadow:  [Custom_shadow_class.vertical_product_shadow],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Custom_colors.border_primary, // Border color
            width: 1,
          ),
          color:  dark ? Custom_colors.darker_grey : Custom_colors.light_grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // picture , wishlist , discount tag
            Custom_container(
              height: Device_util.get_height(context)*0.24,
              width: double.infinity,
              radius: 16,
              padding_in: EdgeInsets.zero,
              padding_out: EdgeInsets.zero,
               background_color: dark ? Custom_colors.dark : Custom_colors.grey.withOpacity(0.5),
              child: Stack(
                children: [
                  // picture
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Set desired border radius
                    child: Center(
                      child: Image.network(
                        image,
                        width: double.infinity,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null)
                            return child;
                          return CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          );
                        },
                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                          return Text('Error loading image.');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// sale tag
                  Positioned(
                    child: Custom_container(
                      radius: 8,
                      background_color: Custom_colors.secondary.withOpacity(0.8),
                      padding_in: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                      child: Text("25%", style: Theme.of(context).textTheme.labelMedium!.apply(color: Custom_colors.black),),
                    ),
                  ),

                  /// Favorite icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: dark ? Custom_colors.black.withOpacity(0.9) : null,
                      ),
                      child: Padding(
                        padding: EdgeInsets.zero,
                        child: Center(child: IconButton(onPressed: (){}, icon: Icon(Iconsax.heart5,color: Colors.red))),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ---details
            product_details(name: name, has_brand: has_brand, price: price, icon: icon, product_id: id)
          ],
        ),

      ),
    );
  }
}


//  Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Center(
//                         child:
//                         // Image.asset("assets/images/iphone.png",fit: BoxFit.cover)
//
//                       Image.network(
//                        image,
//                       loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//                         if (loadingProgress == null)
//                           return child;
//                         return CircularProgressIndicator(
//                           value: loadingProgress.expectedTotalBytes != null
//                               ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                               : null,
//                         );
//                       },
//                       errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
//                         return Text('Error loading image.');
//                       },
//                         fit: BoxFit.cover,
//                     ),
//                   ),
//                         // Image.network(image)
//                         // Image.asset("assets/images/iphone.png",fit: BoxFit.cover)
//                       ),

