import 'package:json_annotation/json_annotation.dart';

part 'geo.model.g.dart';

@JsonSerializable()
class GeoData {
  final String? query;
  final String? country;
  final String? countryCode;
  final String? region;
  final String? regionName;
  final String? city;
  final String? zip;
  final double? lat;
  final double? lon;

  const GeoData({
    this.query,
    this.country,
    this.countryCode,
    this.region,
    this.regionName,
    this.city,
    this.zip,
    this.lat,
    this.lon,
  });

  factory GeoData.fromJson(Map<String, dynamic> json) =>
      _$GeoDataFromJson(json);

  Map<String, dynamic> toJson() => _$GeoDataToJson(this);
}
