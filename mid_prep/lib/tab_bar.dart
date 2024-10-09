import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("TabBar"),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(child: Text("Flight")),
                Tab(icon: Icon(Icons.train)),
                Tab(icon: Icon(Icons.directions_car))
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.flight, size: 300),
              Icon(Icons.directions_transit, size: 300),
              Icon(Icons.directions_car, size: 300)
            ],
          ),
        ));
  }
}
