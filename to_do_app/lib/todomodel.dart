// We create model class for separating data layer from logic and view although logic and view we have combined but 
//the better approach is to separate them
class ToDoModel {
  final String title;
  final String description;
  final DateTime date;

// constructor
  ToDoModel({
    required this.title,
    required this.description,
    required this.date,
  });
}
