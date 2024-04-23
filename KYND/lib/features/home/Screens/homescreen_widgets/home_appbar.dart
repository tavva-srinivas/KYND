import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:badges/badges.dart' as badges;

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
        IconButton(onPressed: (){}, icon: badges.Badge(badgeContent : Text('12',style: TextStyle(fontSize: 14),),badgeStyle:badges.BadgeStyle(badgeColor: Colors.white,padding: EdgeInsets.all(1)),child: const Icon(Iconsax.notification,color: Colors.white,size: 24,))),
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.note,color: Colors.white,size: 24,))
      ],
    );
  }
}


