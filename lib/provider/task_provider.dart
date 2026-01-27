import 'package:flutter/material.dart';
import 'package:taski_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  void createTask({required String title, required String description}) {
    tasks.add(
      TaskModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        description: description,
        isCompleted: false,
      ),
    );
    notifyListeners();
  }

  void completeTask(int id) {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index == -1) return;

    tasks[index] = tasks[index].copyWith(
      isCompleted: !tasks[index].isCompleted,
    );
    notifyListeners();
  }

  void removeTask(int id) {
    tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void removeAllTask() {
    tasks.removeRange(0, tasks.length);
    notifyListeners();
  }
}
