import 'package:get/get.dart';
import 'package:myapp/model/weather.model.dart';
import 'package:myapp/source/clients/weather.client.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  @override
  Future<WeatherData> getWeatherByCity({required String city}) {
    return Get.find<WeatherClient>().getWeatherData(city);
  }
}

abstract class WeatherRepository {
  Future<WeatherData> getWeatherByCity({required String city});
}