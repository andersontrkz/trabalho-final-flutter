import 'package:get/get.dart';
import 'package:myapp/controllers/weather.controller.dart';
import 'package:myapp/model/weather.model.dart';

class WeatherService extends GetxService {
  final WeatherController weatherController = Get.find();

  Future<WeatherData> getWeather(String city) async {
    return weatherController.getWeather(city: city);
  }
}
