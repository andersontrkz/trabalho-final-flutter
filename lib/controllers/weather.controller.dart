import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:myapp/model/weather.model.dart';

import '../repositories/weather.repository.dart';

class WeatherController extends GetxController with StateMixin<WeatherData>{

  WeatherController({required this.repository}){
    change(null, status: RxStatus.empty());
  }

  final WeatherRepository repository;

  Future<WeatherData> getWeather({required String city}) async {
    change(null, status: RxStatus.loading());

    return repository.getWeatherByCity(city: city);
  }
}