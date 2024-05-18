import 'package:flutter/material.dart';

class In_orders_screen extends StatelessWidget {
  const In_orders_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Inorders"),
          ),
          Image.network("https://res.cloudinary.com/dczkxl7th/image/upload/v1713992428/1/dmu1k1elrdrxhwfezwi9.jpg")
        ],
      ),
    );
  }
}
