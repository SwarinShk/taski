import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:taski_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> allTasks = [];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future fetchAllTask() async {
    var querySnapshot = await _firestore
        .collection('allTasks')
        .where('createdBy', isEqualTo: _auth.currentUser!.email!)
        .get();

    allTasks.clear();
    for (var doc in querySnapshot.docs) {
      allTasks.add(TaskModel.fromJson(doc.data()));
    }
    notifyListeners();
  }

  void createTask({required String title, required String description}) async {
    var newTask = TaskModel(
      createdBy: _auth.currentUser!.email!,
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description,
      isCompleted: false,
    );
    await _firestore
        .collection('allTasks')
        .doc(newTask.id.toString())
        .set(newTask.toJson());

    allTasks.add(newTask);
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

  void removeTask(int id) async {
    await _firestore.collection('allTasks').doc(id.toString()).delete();
    fetchAllTask();

    // allTasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void removeAllCompletedTasks() async {
    for (var task in completedTasks) {
      await _firestore.collection('allTasks').doc(task.id.toString()).delete();
    }
    fetchAllTask();

    // allTasks.removeWhere((task) => task.isCompleted);
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

  void invalidate() {
    allTasks.clear();
    notifyListeners();
  }
}
