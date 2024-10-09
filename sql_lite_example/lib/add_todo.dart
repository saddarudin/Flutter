import 'package:flutter/material.dart';
import 'package:sql_lite_example/todo.dart';
import 'package:sql_lite_example/todo_db.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController tc = TextEditingController();
  final TextEditingController dc = TextEditingController();
  DateTime date = DateTime.now();

  TodoDatabase db = TodoDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              controller: tc,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),
            TextFormField(
              controller: dc,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Description",
              ),
            ),
            Row(
              children: [
                Text(date.toString()),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2030),
                    );
                    setState(() {
                      if (pickedDate != null) {
                        date = pickedDate;
                      }
                    });
                  },
                  child: const Text("Choose Date"),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                Todo todo =
                    Todo(title: tc.text, description: dc.text, date: date);
                await db.insertToDo(todo);
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
