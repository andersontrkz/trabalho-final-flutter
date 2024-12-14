import 'dart:developer';

import 'package:get/get.dart';
import 'package:myapp/model/task.model.dart' as Model;
import 'package:myapp/services/weather.services.dart';
import 'package:myapp/source/local/database.dart';
import '../controllers/task.controller.dart';
import 'ip.services.dart';

class TaskService extends GetxService {
  final TaskController taskController = Get.find();

  late IpService ipService = Get.find();
  late WeatherService watherService = Get.find();

  Future<List<TaskDataData>> getSavedData() async {
    await taskController.getSavedData();
    return taskController.state ?? [];
  }

  Future<void> insertData({Model.Task? task}) async {

    var geoIp = await ipService.getGeoIp();
    var city = geoIp.city ?? '';

    var wather = await watherService.getWeather(city);
    var condition = wather.current?.condition!.text ?? '';

    var newTask = Model.Task(
      title: task?.title ?? '',
      done: task?.done ?? false,
      weather: condition,
      city: city,
    );

    await taskController.insertData(task: newTask);
  }
}
