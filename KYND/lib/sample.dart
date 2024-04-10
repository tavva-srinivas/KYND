import 'package:flutter/material.dart';
class sample extends StatefulWidget {
  const sample({super.key});

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ElevatedButton(onPressed: () { print("hello"); }, child: null),
    );
  }
}
