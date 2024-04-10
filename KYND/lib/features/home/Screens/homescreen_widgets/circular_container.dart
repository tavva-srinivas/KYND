import 'package:flutter/material.dart';

class Custom_container extends StatelessWidget {

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final double margin_right;
  final Color? background_color;
  final Widget? child;
  final border_color;

  const Custom_container({
    super.key,
    this.width,
    this.height,
    this.radius = 400,
    this.padding = 0,
    this.margin_right = 0,
    this.background_color = Colors.white,
    this.border_color = Colors.transparent,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: margin_right),
      width: width,
      height: height,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: border_color, // Border color
            width: 2.0, // Border thickness
          ),
          color: background_color,
      ),
      child: child,
    );
  }
}
