import 'package:flutter/material.dart';
import 'package:myapp/services/task.services.dart';
import 'package:myapp/model/task.model.dart' as Model;

class TaskProvider with ChangeNotifier {
  int _taskCount = 0;
  final TaskService _taskService;

  TaskProvider(this._taskService);

  int get taskCount => _taskCount;

  Future<void> updateTaskCount() async {
    var allTasks = await _taskService.getSavedData();
    _taskCount = allTasks?.length ?? 0;
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    Model.Task newTask = Model.Task(title: title, done: false, city: '', weather: '');
    await _taskService.insertData(task: newTask);
    await updateTaskCount();
  }
}
