import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/circular_container.dart';
import 'package:kynd/features/product_review/screens/helping_widgets/Rating_stars.dart';
import 'package:kynd/utils/constants/colors.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:readmore/readmore.dart';

class User_review_card extends StatelessWidget {
  const User_review_card({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Device_util.is_dark_mode(context);
    return Container(
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.blueAccent,child: Icon(Icons.person,color: Colors.white,),),
                  SizedBox(width: 12,),
                  Text("Srinivas",style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
            ],
          ),
          SizedBox(height: 4,),
          
          /// Review
          Row(
            children: [
              RatingStars(rating: 4,size: 16,),
              SizedBox(width: 8,),
              Text("01 Nov,2023",style: Theme.of(context).textTheme.bodyMedium,)
            ],
          ),
          SizedBox(height: 4,),

          /// Description
          ReadMoreText("A Flutter plugin that allows for expanding and collapsing text with the added capability to style and interact with specific patterns in the text like hashtags, URLs, and mentions using the new Annotation feature",
          trimLines: 2,
            trimMode: TrimMode.Line,
            trimExpandedText: ' show less',
            trimCollapsedText: ' show more',
            moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Custom_colors.primary),
            lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Custom_colors.primary),
              ),

          /// Company review
          Custom_container(
            border_thickness: 0,
            radius: 8,
            background_color: dark ? Custom_colors.darker_grey : Custom_colors.grey,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("KYND",style: Theme.of(context).textTheme.titleMedium,),
                      Text("02 Nov,2023",style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),

                  SizedBox(height: 4,),

                  /// Description
                  ReadMoreText("A Flutter plugin that allows for expanding and collapsing text with the added capability to style and interact with specific patterns in the text like hashtags, URLs, and mentions using the new Annotation feature",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimExpandedText: ' show less',
                    trimCollapsedText: ' show more',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Custom_colors.primary),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Custom_colors.primary),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24,)
        ],
      ),

    );
  }
}
