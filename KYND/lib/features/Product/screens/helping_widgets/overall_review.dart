import 'package:flutter/material.dart';

import '../helping_widgets/Rating_bar.dart';
import '../helping_widgets/Rating_stars.dart';
import '../product_review.dart';

class Overall_review extends StatelessWidget {
  const Overall_review({
    super.key,
    required this.full_review,
    required this.product_id

  });

  final bool full_review;
  final String product_id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
                  Rating_bar(rating:'1', value: 0)

                ],
              ),
            )
          ],
        ),
        RatingStars(rating: 4.8,),
        TextButton(
          onPressed: ()  => full_review ? null :  Navigator.pushNamed(context, Product_review.route_name, arguments: product_id ),
          child: Text("615 Reviews >>",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blue)),
        ),

      ],
    );
  }
}
