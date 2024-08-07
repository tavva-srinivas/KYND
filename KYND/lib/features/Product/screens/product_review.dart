import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kynd/features/product/screens/user_review_card.dart';


import 'helping_widgets/Rating_bar.dart';
import 'helping_widgets/Rating_stars.dart';
import 'helping_widgets/overall_review.dart';

class Product_review extends StatefulWidget {
  static const String route_name = '/Product';
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
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Overall_review(full_review: true, product_id: widget.product_id,),

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


