import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class notification_bar extends StatelessWidget {
  const notification_bar({
    super.key, this.on_pressed, this.icon_color = Colors.white, this.notification_color = Colors.black54,
  });

  final VoidCallback? on_pressed;
  final Color icon_color;
  final Color notification_color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Iconsax.notification,color: Colors.white,size: 24,)),
        Positioned(
            right: 5,
            top: 3,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: notification_color
              ),
              child: Center(child: Text("2",style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white,fontSizeFactor: 0.9),)),
            ))
      ],
    );
  }
}
