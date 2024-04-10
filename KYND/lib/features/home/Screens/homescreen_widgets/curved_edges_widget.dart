import 'package:flutter/material.dart';

import 'curved_edges.dart';

class Curved_edges_widget extends StatelessWidget {
  final Widget? child;
  const Curved_edges_widget({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: Custom_curved_edges(),
        // we get the Size from the ""Child""(ie, container)
        child: child
    );
  }
}