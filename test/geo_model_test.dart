import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/model/geo.model.dart';

void main() {
  group('GeoData', () {
    test('deve criar um objeto GeoData', () {
      final Map<String, dynamic> json = {
        'query': '192.168.1.1',
        'country': 'Brasil',
        'countryCode': 'BR',
        'region': 'SP',
        'regionName': 'São Paulo',
        'city': 'São Paulo',
        'zip': '01000-000',
        'lat': -23.55052,
        'lon': -46.633308
      };

      final geoData = GeoData.fromJson(json);

      expect(geoData.query, '192.168.1.1');
      expect(geoData.country, 'Brasil');
      expect(geoData.countryCode, 'BR');
      expect(geoData.region, 'SP');
      expect(geoData.regionName, 'São Paulo');
      expect(geoData.city, 'São Paulo');
      expect(geoData.zip, '01000-000');
      expect(geoData.lat, -23.55052);
      expect(geoData.lon, -46.633308);
    });

    test('deve converter um objeto GeoData', () {
      final geoData = GeoData(
        query: '192.168.1.1',
        country: 'Brasil',
        countryCode: 'BR',
        region: 'SP',
        regionName: 'São Paulo',
        city: 'São Paulo',
        zip: '01000-000',
        lat: -23.55052,
        lon: -46.633308,
      );

      final json = geoData.toJson();

      expect(json['query'], '192.168.1.1');
      expect(json['country'], 'Brasil');
      expect(json['countryCode'], 'BR');
      expect(json['region'], 'SP');
      expect(json['regionName'], 'São Paulo');
      expect(json['city'], 'São Paulo');
      expect(json['zip'], '01000-000');
      expect(json['lat'], -23.55052);
      expect(json['lon'], -46.633308);
    });

    test('deve mapear corretamente com valores nulos', () {
      final geoData = GeoData(
        query: null,
        country: null,
        countryCode: null,
        region: null,
        regionName: null,
        city: null,
        zip: null,
        lat: null,
        lon: null,
      );

      final json = geoData.toJson();

      expect(json['query'], null);
      expect(json['country'], null);
      expect(json['countryCode'], null);
      expect(json['region'], null);
      expect(json['regionName'], null);
      expect(json['city'], null);
      expect(json['zip'], null);
      expect(json['lat'], null);
      expect(json['lon'], null);

      final geoDataFromJson = GeoData.fromJson(json);

      expect(geoDataFromJson.query, null);
      expect(geoDataFromJson.country, null);
      expect(geoDataFromJson.countryCode, null);
      expect(geoDataFromJson.region, null);
      expect(geoDataFromJson.regionName, null);
      expect(geoDataFromJson.city, null);
      expect(geoDataFromJson.zip, null);
      expect(geoDataFromJson.lat, null);
      expect(geoDataFromJson.lon, null);
    });
  });
}
