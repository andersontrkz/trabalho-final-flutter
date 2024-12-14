import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myapp/model/task.model.dart' as Model;
import 'package:get/get.dart';

import '../repositories/task.repository.dart';
import '../services/notification.services.dart';
import '../source/local/database.dart';

class TaskController extends GetxController with StateMixin<List<TaskDataData>> {
  TaskController({required this.repository}) {
    change(null, status: RxStatus.empty());
  }

  final TaskRepository repository;

  Future<void> getSavedData() async {
    change(null, status: RxStatus.loading());

    try {
      final data = await repository.getSavedData();
      change(data, status: RxStatus.success());
    } catch (error) {
      change(null, status: RxStatus.error(error.toString()));
      print('[TaskController] getSavedData Operation error: $error');
    }
  }

  Future<void> insertData({Model.Task? task}) async {
    try {
      await repository.insertData(task: task);
      await getSavedData();
    } catch (error) {
      print('[TaskController] insertData Operation error: $error');
    }
  }

  Future<void> updateData(TaskDataData task) async {
    try {
      var taskData = TaskDataData(
          id: task.id,
          title: task.title,
          done: !task.done,
          weather: task.weather,
          city: task.city,
      );
      await repository.updateData(task: taskData);
      await getSavedData();

      if (!task.done) {
        NotificationService.sendNotification(task.title);
      }
    } catch (error) {
      print('[TaskController] updateData Operation error: $error');
    }
  }

  Future<void> deleteData(TaskDataData task) async {
    try {
      await repository.deleteData(task: task);
      await getSavedData();
    } catch (error) {
      print('[TaskController] deleteData Operation error: $error');
    }
  }
}
