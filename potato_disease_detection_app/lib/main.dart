import 'package:flutter/material.dart';
import 'package:potato_disease_detection_app/potato_disease_detection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PotatoDiseaseDetection();
  }
}
