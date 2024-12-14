import 'package:get/get.dart';
import 'package:myapp/model/task.model.dart' as Model;
import 'package:myapp/source/local/database.dart';

class TaskRepositoryImpl implements TaskRepository {

  @override
  Future<List<TaskDataData>> getSavedData() {
    AppDatabase appDatabase = Get.find<AppDatabase>();
    return appDatabase.select(appDatabase.taskData).get();
  }

  @override
  Future<int> insertData({Model.Task? task}) {
    AppDatabase appDatabase = Get.find<AppDatabase>();

    var title = task?.title ?? "";
    var city = task?.city ?? '';
    var weather = task?.weather ?? '';

    return appDatabase
        .into(appDatabase.taskData)
        .insert(TaskDataCompanion.insert(
        title: title,
        city: city,
        weather: weather,
    ));
  }

  @override
  Future<bool> updateData({required TaskDataData task}) async {
    final appDatabase = Get.find<AppDatabase>();

    return await appDatabase.update(appDatabase.taskData).replace(task);
  }

  @override
  Future<void> deleteData({required TaskDataData task}) async {
    final appDatabase = Get.find<AppDatabase>();
    appDatabase.delete(appDatabase.taskData).delete(task);
  }
}

abstract class TaskRepository{
  Future<List<TaskDataData>> getSavedData();
  Future<int> insertData({Model.Task? task});
  Future<bool> updateData({required TaskDataData task});
  Future<void> deleteData({required TaskDataData task});
}