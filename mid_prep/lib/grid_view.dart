import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Container> containers = [];
    for (int i = 100; i <= 1000; i += 100) {
      containers.add(Container(
        color: Colors.blue[i],
        child: Text("Item # ${i / 100}"),
      ));
    }

    return Center(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        ),
        itemCount: containers.length,
        itemBuilder: (context, index) {
          return containers[index];
        },
      ),
    );
  }
}
