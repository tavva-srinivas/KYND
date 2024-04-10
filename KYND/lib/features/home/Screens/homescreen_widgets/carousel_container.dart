import 'package:flutter/cupertino.dart';

import '../../../../utils/devices_utils/device_util.dart';

class carousel_container extends StatelessWidget {
  const carousel_container({
    super.key,
    required this.image_url,
    this.fit = BoxFit.cover,
    this.is_network_image = false,
    this.on_pressed,
    this.border_radius = 10,
  });

  final String image_url;
  final BoxFit? fit;
  final bool is_network_image ;
  final VoidCallback? on_pressed;
  final double border_radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: on_pressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(border_radius),
        ),
        width: double.infinity,
        height: Device_util.get_height(context)*0.1,
        child: ClipRRect(borderRadius: BorderRadius.circular(border_radius),child: is_network_image ? Image.network(image_url,fit: fit,) : Image.asset(image_url,fit: fit,),),

      ),
    );
  }
}
