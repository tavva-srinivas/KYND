import 'package:flutter/cupertino.dart';



class Card_hor_clipper extends CustomClipper<Path> {
  final double offset;

  const Card_hor_clipper({required this.offset});

  @override
  Path getClip(Size size) {
    Path path = Path();
    //2
    path.lineTo(0, size.height);

    //3
    path.lineTo(size.width - offset, size.height);

    //4
    // path.lineTo(size.width - 105, size.height -15);
    path.quadraticBezierTo(size.width - offset + 10, size.height, size.width - offset + 20, size.height - 13);

    //5
    // path.lineTo(size.width - 100 , size.height - 30);
    path.quadraticBezierTo(size.width - offset + 30, size.height - 26, size.width - offset + 40, size.height - 26);

    //6
    path.lineTo(size.width, size.height - 26);

    //7
    path.lineTo(size.width, 0);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
