import 'package:flutter/foundation.dart';
import 'package:taski_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> allTasks = [];

  String _searchText = '';

  List<TaskModel> get pendingTasks =>
      allTasks.where((task) => !task.isCompleted).toList();

  List<TaskModel> get completedTasks =>
      allTasks.where((task) => task.isCompleted).toList();

  List<TaskModel> get filteredTasks {
    if (_searchText.isEmpty) return [];
    return allTasks
        .where(
          (task) =>
              task.title.toLowerCase().contains(_searchText.toLowerCase()),
        )
        .toList();
  }

  void createTask({required String title, required String description}) {
    allTasks.add(
      TaskModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        description: description,
        isCompleted: false,
      ),
    );
    notifyListeners();
  }

  void toggleTaskCompletion(int id) {
    final index = allTasks.indexWhere((task) => task.id == id);
    if (index == -1) return;

    allTasks[index] = allTasks[index].copyWith(
      isCompleted: !allTasks[index].isCompleted,
    );
    notifyListeners();
  }

  void removeTask(int id) {
    allTasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void removeAllCompletedTasks() {
    allTasks.removeWhere((task) => task.isCompleted);
    notifyListeners();
  }

  void search(String text) {
    _searchText = text;
    notifyListeners();
  }

  void clearSearch() {
    _searchText = '';
    notifyListeners();
  }
}
