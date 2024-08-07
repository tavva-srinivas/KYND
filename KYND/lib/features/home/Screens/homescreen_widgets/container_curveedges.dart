import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import 'circular_container.dart';
import 'curved_edges_widget.dart';

class primarycolor_container_with_curvededges extends StatelessWidget {
  const primarycolor_container_with_curvededges({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Curved_edges_widget(
        child:Container(
          color: Custom_colors.primary,
          padding: const EdgeInsets.only(bottom: 0),
            child: Stack(
              children: [
                // for styling in the right of the rigth of home app
                Positioned(top:50,right:-55,child: Custom_container(width: 300,height: 300,radius: 300, background_color: Colors.white.withOpacity(0.1))),
                // we will get an error i we did not use Sized box be careful ---> size.isfinite : is not true  in stack
                Positioned(top:100,right:-55,child: Custom_container(width: 250,height: 250,radius: 250, background_color: Colors.white.withOpacity(0.1))),

                child
              ],
            ),
          ),
    );
  }
}




