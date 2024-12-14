import 'package:json_annotation/json_annotation.dart';

part 'weather.model.g.dart';

@JsonSerializable()
class WeatherData {
  final CurrentWeather? current;

  const WeatherData({
    this.current,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class CurrentWeather {
  final Condition? condition;

  const CurrentWeather({
    this.condition,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class Condition {
  final String? text;
  final String? icon;

  const Condition({
    this.text,
    this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
