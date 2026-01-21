class TaskModel {
  bool isCompleted;
  final String title;
  final String description;

  TaskModel({
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}
