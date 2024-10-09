import 'package:flutter/material.dart';
import 'package:my_first_project/pages/radiobutton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Radiobutton(),
    ); // to create main screen or first screen or home page
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets Demo"),
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(
            Icons.add_card,
            color: Colors.amberAccent,
            size: 36.0,
            semanticLabel: "Click Here",
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
// Material App: allows you to place material Widgets
// Scaffold: Like Frame in Java