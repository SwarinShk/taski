class TaskModel {
  static int _counter = 0;

  final int id;
  bool isCompleted;
  final String title;
  final String description;

  TaskModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
  }) : id = ++_counter;
}
