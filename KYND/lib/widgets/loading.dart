import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/devices_utils/device_util.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child : Lottie.asset(
        'assets/lottie/loading_animation.json',
        width: Device_util.get_width(context)*0.16,
        height: Device_util.get_height(context)*0.16,
        repeat: true, // Set repeat to true for looping animation
      ),
    );
  }
}
