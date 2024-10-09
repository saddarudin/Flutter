// database related work will be done here

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_lite_example/todo.dart';

class TodoDatabase {
  static const _dbName = 'todo.db';
  static const _tableName = 'Todos';
  static const _columnId = 'id';
  static const _columnTitle = 'title';
  static const _columnDesc = 'description';
  static const _columnDate = 'date';

  static Database? _database;
  // getter method with name database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async {
        await db.execute(
            """CREATE TABLE $_tableName ($_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $_columnTitle TEXT NOT NULL, 
      $_columnDesc TEXT NOT NULL,
      $_columnDate TEXT NOT NULL)""");
      },
      version: 1,
    );
    return db;
  }

  Future<List<Todo>> getAllToDos() async {
    final db = await database;
    final todoMaps = await db.query(_tableName);
    List<Todo> todos = [];
    for (var map in todoMaps) {
      var todo = Todo.fromMap(map);
      todos.add(todo);
    }
    return todos;
  }

  insertToDo(Todo todo) async {
    final db = await database;
    return await db.insert(_tableName, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // conflictAlgorithm is used for to prevent the data on same id as id is primary key
    // so we cannot have two objects on same key
  }

  updateTodo(Todo todo) async {
    final db = await database;
    return await db.update(
      _tableName,
      todo.toMap(),
      where: "$_columnId = ? AND $_columnTitle = ?",
      whereArgs: [todo.id, todo.title],
      // whereArgs is the list of the arguments that replace question marks
      // we can directly pass the values instead of ? but SQL injection may happen
    );
  }

  deleteTodo(int id) async {
    final db = await database;
    return await db.delete(
      _tableName,
      where: "$_columnId = ?",
      whereArgs: [id],
    );
  }

  deleteAll() async {
    final db = await database;
    return await db.delete(_tableName);
  }
}
