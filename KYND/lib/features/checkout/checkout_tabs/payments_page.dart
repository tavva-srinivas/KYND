import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/checkout/controllers/checkout_controller.dart';
import 'package:kynd/utils/constants/colors.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:kynd/widgets/product_card_vertical.dart';

class Payments_screen extends StatelessWidget {
   Payments_screen({super.key});

  final CheckoutController checkoutController = Get.find<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:10,vertical: 12),
                    width: 16, // Adjust the size as needed
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.green)
                    ),
                    child: Center(
                      child: Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 10, // Adjust the size of the inner circle
                      ),
                    ),
                  ),
                Expanded(
                    flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("The Popeye plan",style: Theme.of(context).textTheme.titleLarge,overflow: TextOverflow.ellipsis,),
                          Text(" Breakfast",style: Theme.of(context).textTheme.bodySmall,)
                        ],
                      )
                  ),
                  SizedBox(width: 16,),
                  // Expanded(
                  //     child: Text("₹ 1920",style: TextStyle(color: Custom_colors.darker_grey,fontSize:18),)
                  // )

                ],
              ),

              SizedBox(height: 32),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Have a coupon code',
                  labelStyle: TextStyle(color: Custom_colors.darker_grey,fontWeight: FontWeight.w400),
                  hintStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.w400,fontSize: 14),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Apply button press
                      },
                      child: Text('Apply',style: TextStyle(color: Colors.grey.shade400),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Colors.grey.shade500), // Border color
                          ),
                        ),
                      ),
                    ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide(color: Custom_colors.border_secondary)
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  //   borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  //   borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                  // ),
                ),
              ),

              SizedBox(height: 32),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1,color: Custom_colors.border_primary)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex : 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text("Cost"),
                          Text("GST"),
                          Text("Delivery partner fee"),

                          SizedBox(height: 16,),

                          Container(height: 1,width: double.infinity,color: Custom_colors.border_secondary,),

                          SizedBox(height: 8,),

                          Text("Order Total"),
                          Text("Coupon"),
                          SizedBox(height: 12,),
                          Text("To pay",style: TextStyle(color: Custom_colors.white,fontSize: 16),)
                        ],
                      ),
                    ),

                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end
                          ,
                          children: [
                            Text("1920"),
                            Text("160"),
                            Text("24"),

                            SizedBox(height: 16,),

                            Container(height: 1,width: double.infinity,color: Custom_colors.border_secondary,),

                            SizedBox(height: 8,),

                            Text("2104"),
                            Text("104"),
                            SizedBox(height: 12,),
                            Text("2000",style: TextStyle(color: Custom_colors.white,fontSize: 16),)
                          ],
                        ),
                    ),
                    SizedBox(width: 16,)
                  ],
                ),
              ),

              SizedBox(height: 24,),

              Text("Add fruit juice plan to get extra 5% off",style: Theme.of(context).textTheme.titleSmall,),

              // SizedBox(height: 12),


              // ListView.builder(
              //   shrinkWrap: true,
              //   scrollDirection: Axis.horizontal,
              //   itemCount: 20, // Number of items in the list
              //   itemBuilder: (context, index) {
              //     return Container(
              //       width: 150, // Set a fixed width for each item
              //       margin: EdgeInsets.all(8.0),
              //       decoration: BoxDecoration(
              //         color: Colors.blueAccent,
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       child: Product_card_vertical(price: 1200, name: 'Coconut juice', image: '', id: '1234',)
              //     );
              //   },
              // ),


              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Product_card_vertical(price: 1200, name: 'Coconut juice', image: '', id: '1234',),
                      );
                    })

                ),
              ),

              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 26),
        height: Device_util.get_height(context)*0.08,
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8),
                  child: Text("Total",style: TextStyle(fontSize: 13,color: Colors.white)),
                ),

                SizedBox(height: 2),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16,top: 2),
                          child: Text('\u20B9',style: TextStyle(fontSize: 18,color: Colors.white),),
                        ),

                        SizedBox(width: 3),

                        Text("1,800",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),)
                      ],
                    )

                  ],
                ),

                SizedBox(height: 5,)

              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                ),
                child: Text("CHECK OUT",style: Theme.of(context).textTheme.bodyMedium,),
              ),
            )
          ],
        ),
      )
    );
  }
}
