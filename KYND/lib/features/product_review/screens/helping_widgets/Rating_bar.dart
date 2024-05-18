import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/devices_utils/device_util.dart';


class Rating_bar extends StatelessWidget {
  const Rating_bar({
    super.key,
    required this.rating,
    required this.value
  });

  final String rating;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rating,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 12,),
        Expanded(
            child: SizedBox(
                width:
                Device_util.get_width(context) * 0.5,
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: 10,
                  backgroundColor: Custom_colors.grey,
                  valueColor: AlwaysStoppedAnimation(
                      Custom_colors.primary),
                  borderRadius: BorderRadius.circular(7),
                )))
      ],
    );
  }
}
