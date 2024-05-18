import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kynd/features/product_review/screens/helping_widgets/Rating_stars.dart';
import 'package:kynd/features/product_review/screens/user_review_card.dart';
import 'package:kynd/utils/appbar.dart';
import 'package:kynd/utils/constants/colors.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import 'helping_widgets/Rating_bar.dart';

class Product_review extends StatefulWidget {
  static const String route_name = '/product_review';
  const Product_review({super.key, required this.product_id});

  final String product_id;

  @override
  State<Product_review> createState() => _Product_reviewState();
}

class _Product_reviewState extends State<Product_review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Reviews & Ratings",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Ratings and reviews are verified and are from people simliar to you "),
                SizedBox(height: 16),


                /// overall product rating
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 12,),
                    Expanded(
                      flex: 3,
                      child: Text(
                        '4.8',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Rating_bar(rating: '5',value: 0.87,),
                          Rating_bar(rating: '4',value: 0.67,),
                          Rating_bar(rating: '3',value: 0.37,),
                          Rating_bar(rating: '2',value: 0.1,),

                        ],
                      ),
                    )
                  ],
                ),
                RatingStars(rating: 4.8,),
                Padding(
                  padding: const EdgeInsets.only(left: 4,top: 4),
                  child: Text("615 Reviews",style: Theme.of(context).textTheme.bodySmall,),
                ),
                SizedBox(height: 32,),


                /// user reviews list
                User_review_card(),
                User_review_card()




                
              ],
            ),
          ),
        ));
  }
}

