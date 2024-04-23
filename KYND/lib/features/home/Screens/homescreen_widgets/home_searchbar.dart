import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/devices_utils/device_util.dart';

class home_searchbar extends StatelessWidget {
  const home_searchbar({
    super.key,  this.text = "Search . . .",  this.icon = Iconsax.search_normal, this.show_background = true, this.show_border = false, this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });
  final String text;
  final IconData? icon;
  final bool show_background,show_border;
  final EdgeInsetsGeometry padding;


  @override
  Widget build(BuildContext context) {

    bool dark = Device_util.is_dark_mode(context);
    return Padding(
      padding: padding,
      child: Container(
        margin:  const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        height: 45 ,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: show_background ? dark ? Custom_colors.dark : Custom_colors.light :  Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Custom_colors.grey)
        ),
        child: Center(
            child:  Row(
              children: [
                Icon(icon,color: dark ?  Colors.grey : Custom_colors.dark_grey ),
                const SizedBox(width: 16,),
                Text(text,style: Theme.of(context).textTheme.titleSmall!.apply(fontWeightDelta:2,color: Custom_colors.dark_grey),)
              ],
            )
        ),
      ),
    );
  }
}

