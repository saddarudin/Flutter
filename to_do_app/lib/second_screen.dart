import "package:flutter/material.dart";

class SecondScreen extends StatelessWidget {
  final String data;
  const SecondScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Second Screen"),
            ),
            body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.amber,
                    child: Text("Item# $index"),
                  );
                })));
  }
}
