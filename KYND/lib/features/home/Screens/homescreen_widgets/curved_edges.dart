import 'package:flutter/material.dart';

class Custom_curved_edges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0,size.height);

    final firstCurve = Offset(0,size.height-12);
    final lastCurve = Offset(30,size.height-12);
    path.quadraticBezierTo(firstCurve.dx,firstCurve.dy,lastCurve.dx,lastCurve.dy);

    final secondFirstcurve = Offset(30,size.height-12);
    final secondLastcurve = Offset(size.width-12,size.height-12);
    path.quadraticBezierTo(secondFirstcurve.dx, secondFirstcurve.dy, secondLastcurve.dx, secondLastcurve.dy);

    final thirdFirstcurve = Offset(size.width,size.height-12);
    final thirdLastcurve = Offset(size.width,size.height);
    path.quadraticBezierTo(thirdFirstcurve.dx, thirdFirstcurve.dy, thirdLastcurve.dx, thirdLastcurve.dy);


    path.lineTo(size.width,0);
    path.close();

    return path;
  }

  // Advance not using much
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}