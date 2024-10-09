import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/todo_provider.dart';
import 'package:to_do_app/todomodel.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do App'),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              controller: tc,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
            ),
            TextFormField(
              controller: dc,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Description'),
            ),
            Row(
              children: [
                Text(date.toString()),
                ElevatedButton(
                  onPressed: () async {
                    // as user will pick date so this is done in future therefore we are using async
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2030),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        date = pickedDate;
                      });
                    }
                  },
                  child: const Text("Select Date"),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  final todo = ToDoModel(
                      title: tc.text, description: dc.text, date: date);
                  context.read<TodoProvider>().addTodo(todo);
                  Navigator.pop(context);
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
