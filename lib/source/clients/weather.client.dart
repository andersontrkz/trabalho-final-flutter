import 'package:dio/dio.dart';
import 'package:myapp/model/weather.model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather.client.g.dart';

@RestApi(baseUrl: 'https://api.weatherapi.com/v1')
abstract class WeatherClient {
  factory WeatherClient(Dio dio, {String? baseUrl}) = _WeatherClient;

  @GET('/current.json?key=ee99a50abc2d41d5a1d42836241212&q=Guarapuava&aqi=no&lang=pt')
  Future<WeatherData> getWeatherData(String city);
}
