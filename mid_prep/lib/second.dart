import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Second extends StatelessWidget {
  final String data;
  const Second({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
        height: 200,
        color: Colors.green,
        child: Text(data),
      ),
    );
  }
}
