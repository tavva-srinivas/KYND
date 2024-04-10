import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import '../../../../utils/constants/colors.dart';
import '../../controllers.home/home_controller.dart';
import 'carousel_container.dart';
import 'circular_container.dart';

class corousel_slider extends StatelessWidget {
  const corousel_slider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final dark = Device_util.is_dark_mode(context);
    final controller = Home_controller();
    return Stack(
      children: [
        SizedBox(
          height: Device_util.get_height(context)*0.23,
          width: double.infinity,
          child: CarouselSlider(
              items: banners.map((url) => carousel_container(image_url: url)).toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                onPageChanged: (index,_) => controller.update_page_indicator(index)
              )),
        ),


        // Slider
        Positioned(
          bottom: 12,
          right:0,
          left: 0,
          child: Obx( () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<banners.length;i++)
                  Custom_container(width: 8,height:8,margin_right: 10,background_color: controller.carousel_current_index == i ? Custom_colors.primary : Custom_colors.grey ,radius: 10,),
              ],
            ),
          ),
        )
      ],
    );
  }
}