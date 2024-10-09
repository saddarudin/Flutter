class Todo {
  final int? id;
  final String title;
  final String description;
  final DateTime date;
  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.date,
  });

// creating two helper method for sending and receiving the data in the format of map with database
// as developer we love to work with objects instead of map so we are creating these two helper methods
// for converting map into object and object into map

// to call this method we have to create object of Todo and this method itself
//will make another object of Todo
// but we don't want to make an object to call this method so we use 'factory' keyword
  factory Todo.fromMap(Map map) {
    return Todo(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        date: DateTime.parse(map['date']));
  }

  toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String()
      // database uses this format of string Iso8601
    };
  }
}
