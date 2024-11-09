import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:to_do_app/to_do_extended.dart";
import "package:to_do_app/todo_provider.dart";

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => TodoProvider(), //which data to send to all the screen
    child: const MyApp(), //to which screen to provide data
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoExtended(),
    );
  }
}
