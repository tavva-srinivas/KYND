import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

// Appbar takes ----> PrefferedSizeWidget so we need to implement (preferredSizeWidget)
class Custom_Appbar extends StatelessWidget implements PreferredSizeWidget{
  const Custom_Appbar({super.key,
    this.title,
    this.show_backarrow = false,
    this.leading_icon,
    this.actions,
    this.leading_onPressed
  });

  final Widget? title;
  final bool show_backarrow;
  final Icon? leading_icon;
  final List<Widget>? actions;
  final VoidCallback? leading_onPressed;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: show_backarrow ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left)) : leading_icon != null ? IconButton(onPressed: leading_onPressed, icon:leading_icon!) : null,
        title: title,
        actions : actions,

      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Device_util.get_Appbar_height());
}
