import 'package:flutter/material.dart';


class Remainder_screen extends StatefulWidget {
  const Remainder_screen({super.key});

  @override
  State<Remainder_screen> createState() => _Remainder_screenState();
}

class _Remainder_screenState extends State<Remainder_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            "Remainder screen"
          ),
        ),
      ),
    );
  }
}
