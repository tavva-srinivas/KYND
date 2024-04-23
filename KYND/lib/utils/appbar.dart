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
    this.leading_onPressed,
    this.back_color = Colors.transparent,
    this.has_center_title = false,
    this.arrow_color = Colors.black
  });

  final Widget? title;
  final bool show_backarrow;
  final Icon? leading_icon;
  final List<Widget>? actions;
  final VoidCallback? leading_onPressed;
  final Color? back_color;
  final Color? arrow_color;
  final bool? has_center_title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.zero,
      child: AppBar(
        backgroundColor: back_color,
        centerTitle: has_center_title,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        leading: show_backarrow ? IconButton(onPressed: () => Get.back(), icon: arrow_color == Colors.white ? Icon(Iconsax.arrow_left , color: Colors.white,) : Icon(Iconsax.arrow_left) ) : leading_icon != null ? IconButton(onPressed: leading_onPressed, icon:leading_icon!) : null,
        title: title,
        actions : actions,

      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Device_util.get_Appbar_height());
}
