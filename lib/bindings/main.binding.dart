import 'package:get/get.dart';
import 'package:myapp/controllers/ip.controller.dart';
import 'package:myapp/controllers/task.controller.dart';
import 'package:myapp/controllers/weather.controller.dart';
import 'package:myapp/repositories/task.repository.dart';
import 'package:myapp/repositories/weather.repository.dart';
import 'package:myapp/source/clients/weather.client.dart';
import 'package:myapp/source/local/database.dart';
import 'package:myapp/repositories/ip.repository.dart';
import 'package:dio/dio.dart';

import '../services/task.services.dart';
import '../services/weather.services.dart';
import '../services/ip.services.dart';
import '../source/clients/ip.client.dart';

class MainBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(AppDatabase());

    Get.put(IpClient(Dio()));
    Get.put(WeatherClient(Dio()));

    Get.put(IpController(repository: IpRepositoryImpl()));
    Get.put(TaskController(repository: TaskRepositoryImpl()));
    Get.put(IpController(repository: IpRepositoryImpl()));
    Get.put(WeatherController(repository: WeatherRepositoryImpl()));

    Get.put(TaskService());
    Get.put(IpService());
    Get.put(WeatherService());
  }
}