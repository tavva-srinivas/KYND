import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Custom_container extends StatelessWidget {

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry padding_in;
  final EdgeInsetsGeometry padding_out;
  final double margin_right;
  final Color? background_color;
  final Widget? child;
  final border_color;

  const Custom_container({
    super.key,
    this.width,
    this.height,
    this.radius = 400,
    this.padding_in = EdgeInsets.zero,
    this.padding_out = const EdgeInsets.all(8),
    this.margin_right = 0,
    this.background_color = Colors.white,
    this.border_color = Colors.transparent,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding_out,
      child: Container(
        margin: EdgeInsets.only(right: margin_right),
        width: width,
        height: height,
        padding: padding_in,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
          border: Border.all(
              color: border_color, // Border color
              width: 2.0, // Border thickness
            ),
            color: background_color,
          // color: Colors.redAccent.shade200,

        ),
        child: child,
      ),
    );
  }
}
