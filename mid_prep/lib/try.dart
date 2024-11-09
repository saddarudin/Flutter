import 'package:flutter/material.dart';

class Try extends StatelessWidget {
  const Try({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/second', arguments: 'abc');
          },
          child: const Text("data"),
        ),
      ),
    );
  }
}
