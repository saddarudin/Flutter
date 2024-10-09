import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});
  @override
  State<ToDoApp> createState() => _ToDoApp();
}

class _ToDoApp extends State<ToDoApp> {
  List<String> title = ['A', 'B', 'C'];
  List<String> subtitle = ['aa', 'bb', 'cc'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
        centerTitle: true,
        leading: const Icon(
          Icons.circle_rounded,
          size: 36,
        ),
        actions: [
          ElevatedButton(onPressed: () {}, child: const Text("B1")),
          ElevatedButton(
            onPressed: () {},
            child: const Text("B2"),
          ),
        ],
      ),
      body: Center(
          child: ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(title[index]),
            subtitle: Text(subtitle[index]),
            trailing: const Wrap(
              spacing: 12,
              children: <Widget>[Icon(Icons.done), Icon(Icons.delete)],
            ),
          );
        },
      )),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(onPressed: () {}, child: const Text("Add")),
          ElevatedButton(onPressed: () {}, child: const Text("Remove"))
        ],
      ),
    );
  }
}
