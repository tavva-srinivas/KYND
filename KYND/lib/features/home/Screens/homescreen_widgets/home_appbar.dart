import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../utils/appbar.dart';
import '../../../../utils/constants/colors.dart';
import 'notification_icon.dart';


class home_appbar extends StatelessWidget {
  final Color heading_color;
  final Color subHead_color;
  final Color icon_color;
  final List<Widget> icons;
  final String heading;
  final String sub_heading ;
  final Color? icon_backgrund;

  const home_appbar({
    Key? key,
    this.heading_color = Colors.white,
    this.subHead_color = Custom_colors.grey,
     this.icon_color = Colors.white,
     required this.sub_heading,
    required this.heading,
    this.icon_backgrund,

    this.icons = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Custom_Appbar(
      icon_background: icon_backgrund,
      leading_icon:  Icon(Iconsax.location5, size: 30,color: icon_color,),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(heading,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: heading_color,
              fontWeight: FontWeight.w600
          )),
          Text(sub_heading,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: subHead_color,
             fontWeight: FontWeight.w400,
            fontSize: 13
          ),)
        ],
      ),
      actions: icons
    );
  }
}
