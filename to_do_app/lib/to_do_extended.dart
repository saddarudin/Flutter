import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/add_todo.dart';
import 'package:to_do_app/todo_provider.dart';
import 'package:to_do_app/todomodel.dart';

class ToDoExtended extends StatelessWidget {
  const ToDoExtended({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoProvider>().todos; //todos is getter
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TodoProvider>(builder: (context,todoprovider,child){
              return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                List<ToDoModel> todos = todoprovider.todos;
                return ListTile(
                  title: Text(todos[index].title),
                  subtitle: Text(
                      ("${todos[index].description} - ${todos[index].date}")),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<TodoProvider>().removeTodo(todos[index]);
                    },
                  ),
                );
              },
            );
            },)
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AddTodo();
                    }));
                  },
                  child: const Text('Add Task')),
              ElevatedButton(
                  onPressed: () {
                    context.read<TodoProvider>().removeAll();
                  },
                  child: const Text('Delete All'))
            ],
          )
        ],
      ),
    );
  }
}
