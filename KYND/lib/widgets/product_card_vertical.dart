import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/circular_container.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:kynd/widgets/helper_to_product_card/shadow_product_card.dart';

import '../utils/constants/colors.dart';
import 'helper_to_product_card/product_title_text.dart';


class Product_card_vertical extends StatelessWidget {
  const Product_card_vertical({super.key});



  @override
  Widget build(BuildContext context) {
    final dark = Device_util.is_dark_mode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: Device_util.get_width(context) *0.5 ,
        height: Device_util.get_height(context)*0.365,
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
               background_color: dark ? Custom_colors.dark : Custom_colors.grey,
              child: Stack(
                children: [
                  SizedBox(height: 20,width: double.infinity,),
                  // picture

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(child: Image.asset("assets/images/iphone.png",fit: BoxFit.cover)),

                  ),

                  //sale tag
                  Positioned(
                      child: Custom_container(
                        radius: 8,
                        background_color: Custom_colors.secondary.withOpacity(0.8),
                        padding_in: EdgeInsets.symmetric(horizontal: 3,vertical: 0),
                        child: Text("25%" ,style: Theme.of(context).textTheme.labelMedium!.apply(color: Custom_colors.black),),)),

                  /// Favorite icon button
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: dark ? Custom_colors.black.withOpacity(0.9) : Custom_colors.grey.withOpacity(0.9)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.zero,
                        child: Center(child: IconButton(onPressed: (){}, icon: Icon(Iconsax.heart5,color: Colors.red))),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ---details
            Flexible(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 16,top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Cutom_title_text(text: 'Iphone 15',textAlign: TextAlign.left,),
                      // SizedBox(height: 2,),
                      Row(
                        children: [
                          /// brand name
                          Text("Apple",overflow: TextOverflow.ellipsis,maxLines: 1,style: Theme.of(context).textTheme.bodySmall),
                          SizedBox(width: 2,),
                          /// verify
                          Icon(Iconsax.verify5,color: Custom_colors.primary,size: 20,)
                        ],
                      ),
              
                      SizedBox(height: 8,),
                      // Spacer(),
                      Flexible(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('\u20B9'),
                                  SizedBox(width: 2,),
                                  Flexible(
                                    child: Text(
                                      "98400",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                      
                            // Add item symbol
                            Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: Custom_colors.dark.withOpacity(0.9),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16)
                                )
                              ),
                              child: SizedBox(
                                width: 40,
                                  height: 40,
                                  child: Icon(Iconsax.add , color: Colors.white,)),
                            )
                          ],
                        ),
                      )
                     ],
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
