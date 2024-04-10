import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/appbar.dart';
import '../../../../utils/constants/colors.dart';
import 'notification_icon.dart';


class home_appbar extends StatelessWidget {
  const home_appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Custom_Appbar(
      leading_icon: const Icon(Iconsax.location,color: Colors.white,size: 30,),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Moghalrajpuram",style: Theme.of(context).textTheme.headlineMedium?.apply(
              color: Colors.white
          )),
          Text("Suryaraopet Vijayawada",style: Theme.of(context).textTheme.bodyMedium?.apply(
              color: Custom_colors.grey
          ),)
        ],
      ),
      actions: [
        const notification_bar(),
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.note,color: Colors.white,size: 24,))
      ],
    );
  }
}


