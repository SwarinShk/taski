import 'package:flutter/material.dart';
import 'package:taski_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  void createTask(TaskModel task) {
    tasks.add(task);
    notifyListeners();
  }

  void completeTask(TaskModel task) {
    final index = tasks.indexOf(task);
    if (index == -1) return;

    // tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks[index].isCompleted = true;
    notifyListeners();
  }

  void removeTask(TaskModel task) {
    tasks.remove(task);
    notifyListeners();
  }

  void removeAllTask() {
    tasks.removeRange(0, tasks.length);
    notifyListeners();
  }
}
