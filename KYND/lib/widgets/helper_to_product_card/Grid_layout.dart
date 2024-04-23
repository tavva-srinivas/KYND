import 'package:flutter/material.dart';

import '../../utils/devices_utils/device_util.dart';
import '../product_card_vertical.dart';


class gridlayout extends StatelessWidget {
   gridlayout({
    super.key,
    required this.item_count,
     this.main_axis_extent = null ,
    required this.item_builder,
  });

  final int item_count;
  final double? main_axis_extent;
  final Widget? Function(BuildContext , int) item_builder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount : item_count,
        physics: NeverScrollableScrollPhysics(),
        // using this widgets take only the space required
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 4),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
          mainAxisExtent: main_axis_extent,
        ),
        itemBuilder: item_builder
    );
  }
}


