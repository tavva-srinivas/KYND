import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/devices_utils/device_util.dart';

class home_searchbar extends StatelessWidget {
  const home_searchbar({
    super.key,  this.text = "Search . . .",  this.icon = const Icon(Iconsax.search_normal,color: Custom_colors.dark_grey,), this.show_background = true, this.show_border = false,
  });
  final String text;
  final Icon icon;
  final bool show_background,show_border;

  @override
  Widget build(BuildContext context) {

    bool dark = Device_util.is_dark_mode(context);
    return Container(
      margin:  const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
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
              icon,
              const SizedBox(width: 16,),
              Text("Search . . .",style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.black.withOpacity(0.55)))
            ],
          )
      ),
    );
  }
}

