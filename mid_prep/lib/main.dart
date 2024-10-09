import 'package:flutter/material.dart';
import 'package:mid_prep/forms.dart';
import 'package:mid_prep/second.dart';
import 'package:mid_prep/try.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCustomForm(),
    );
  }
}