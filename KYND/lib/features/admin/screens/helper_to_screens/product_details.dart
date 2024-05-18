import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/admin/screens/helper_to_screens/rupee_price.dart';
import 'package:kynd/features/admin/services/admin_services.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../widgets/helper_to_product_card/product_title_text.dart';

class product_details extends StatelessWidget {
  const product_details({
    super.key,
    required this.name,
    required this.has_brand,
    required this.price,
    required this.icon,
    required this.product_id
  });

  final String name;
  final bool has_brand;
  final int price;
  final IconData icon;
  final String product_id;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // height:100 ,
        child: Padding(
          padding: EdgeInsets.only(left: 16,top: 8,bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Cutom_title_text(text: name,textAlign: TextAlign.left,),
              // SizedBox(height: 2,),
              SizedBox(height: 0,),
              has_brand ? Row(
                children: [
                  /// brand name
                  Text("Apple",overflow: TextOverflow.ellipsis,maxLines: 1,style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(width: 2,),
                  /// verify
                  Icon(Iconsax.verify5,color: Custom_colors.primary,size: 20,)
                ],
              ) : SizedBox(height: 0,),
              //
              // SizedBox(height: 8,),
              // Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: ruppe_cost(price: price),
                        )
                      ],
                    ),
                  ),

                  // Add item symbol or delete
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Custom_colors.darker_grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)
                        )
                    ),
                    child: Center(
                      child: SizedBox(
                          width: 48,
                          height: 45,
                          child: IconButton(color: Colors.white, onPressed: () {
                             print("comming to icon button");
                             Admin_services.delete_product(context: context, id:product_id );

                          }, icon: Icon(icon))
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
