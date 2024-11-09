import 'package:flutter/material.dart';
import 'package:to_do_app/todomodel.dart';

class TodoProvider with ChangeNotifier {
  final List<ToDoModel> _todos = [
    ToDoModel(
        title: "some", description: "some description", date: DateTime.now()),
    ToDoModel(
        title: "some", description: "some description", date: DateTime.now()),
  ];

// short hand notation for creating getter
  List<ToDoModel> get todos => _todos;

  // other method of creating getter
  // List<ToDoModel> getToDos(){
  //   return _todos;
  // }

  addTodo(ToDoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  removeTodo(ToDoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  removeAll() {
    _todos.clear();
    notifyListeners();
  }
}
