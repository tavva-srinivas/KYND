import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/features/Onboarding/onboarding.controllers/onboarding_controller.dart';
import 'package:kynd/features/Onboarding/screens/widgets/page_indicator.dart';
import 'package:kynd/features/Onboarding/screens/widgets/page_view.dart';
import 'package:kynd/features/Onboarding/screens/widgets/skip.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';


class Onboarding_screen extends StatelessWidget {
  static const String route_name = '/onboarding';
  const Onboarding_screen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Here we register a controller globally using Get.put(controller)
    /// so the controller becomes available for retrieval anywhere in your app using Get.find().
    final Onboarding_controller controllerOnboard = Get.put(Onboarding_controller());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            // Page view
            page_view(controller_onboard: controllerOnboard),

            // Skip
            const skip(),

            SizedBox(height: Device_util.mq(context).height*0.1,),

            // Next button and page indicator
            const onboard_pageindicator_next(),
            // Positioned(bottom: Device_util.get_bottomNavigationBarHeight(context)+20,right:25,child: ElevatedButton(onPressed:(){} ,child:Icon(Icons.keyboard_arrow_right_outlined,color: Colors.white,size: 25,),style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Device_util.is_dark_mode(context) ? Custom_colors.primary : Custom_colors.dark,)))
          ],
             // Horizontal scroll pages


             // Skip button



            // Dot navigation Smooth page indicator



           // Circular button
        ),
      ),
    );
  }
}

// class page_view extends StatelessWidget {
//   const page_view({
//     super.key,
//     required this.controller_onboard,
//   });
//
//   final Onboarding_controller controller_onboard;
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: controller_onboard.page_controller,
//       // it will automatically pass the index
//       onPageChanged: controller_onboard.update_page_indicator,
//       children: [
//         Column(
//           children: [
//             Image.asset("assets/svgs/nutritionist and plan.jpg",width: Device_util.mq(context).width,height: Device_util.mq(context).height*0.6,),
//             Text(Custom_text.board_1,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
//             SizedBox(height: 15),
//             Text(Custom_text.board_sub_1,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,)
//           ],
//         ),
//         Column(
//           children: [
//             SvgPicture.asset("assets/svgs/Growing2.svg",width: Device_util.mq(context).width,height: Device_util.mq(context).height*0.55,),
//             Text(Custom_text.board_2,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
//             SizedBox(height: 15),
//             Text(Custom_text.board_sub_2,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,)
//           ],
//         ),
//         Column(
//           children: [
//             SvgPicture.asset("assets/svgs/confused.svg",width: Device_util.mq(context).width,height: Device_util.mq(context).height*0.55,),
//             Text(Custom_text.board_3,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
//             SizedBox(height: 15),
//             Text(Custom_text.board_sub_3,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,)
//           ],
//         )
//       ],
//     );
//   }
// }

// class skip extends StatelessWidget {
//   const skip({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(top: kToolbarHeight+8,right: Device_util.get_width(context)*0.08,child: TextButton(onPressed: () => Onboarding_controller.instance.skip_page(),child: Text('Skip',style: Theme.of(context).textTheme.bodyMedium,),));
//   }
// }


// class onboard_pageindicator_skip extends StatelessWidget {
//   const onboard_pageindicator_skip({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Onboarding_controller.instance;
//     return Positioned(bottom: Device_util.get_bottomNavigationBarHeight(context)+30,left:25,child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SmoothPageIndicator(
//           controller: controller.page_controller,
//           // again the index is passed automatically for the dotnavigation
//           onDotClicked: controller.dotnavigation_click,
//           count: 3,
//           effect: ExpandingDotsEffect(activeDotColor: Device_util.is_dark_mode(context) ? Custom_colors.light : Custom_colors.dark,dotHeight: 5),
//         ),
//         SizedBox(width:Device_util.get_width(context)*0.5,),
//         ElevatedButton(onPressed:(){} ,child:Icon(Icons.keyboard_arrow_right_outlined,color: Colors.white,size: 25,),style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: Device_util.is_dark_mode(context) ? Custom_colors.primary : Custom_colors.dark,))
//       ],
//     ));
//   }
// }


