import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.0),
          MenuItem(name: "Paneer Paratha", quantity: "3 p"),
          SizedBox(height: 8.0),
          MenuItem(name: "Dahi (Curd)", quantity: "1 cup"),
          SizedBox(height: 8.0),
          MenuItem(name: "Green Chutney", quantity: "1/2 cup"),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String name;
  final String quantity;

  const MenuItem({required this.name, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            quantity,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
