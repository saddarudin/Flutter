import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text("Hello1"),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        const Center(
          child: Text("Hello3"),
        ),
        ElevatedButton(onPressed: (){}, child: const Text("Click"))
      ],
    ));
  }
}
