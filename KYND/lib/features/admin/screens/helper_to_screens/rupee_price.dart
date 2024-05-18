import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class ruppe_cost extends StatelessWidget {
  const ruppe_cost({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('\u20B9',style: TextStyle(fontSize: 14),),
        SizedBox(width: 3,),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top:2),
            child: Text(
              "${price}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
      ],
    );
  }
}