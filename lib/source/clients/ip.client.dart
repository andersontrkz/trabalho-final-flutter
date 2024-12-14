import 'package:dio/dio.dart';
import 'package:myapp/model/geo.model.dart';
import 'package:retrofit/retrofit.dart';

part 'ip.client.g.dart';

@RestApi(baseUrl: 'http://ip-api.com')
abstract class IpClient {
  factory IpClient(Dio dio, {String? baseUrl}) = _IpClient;

  @GET('/json/{ip}')
  Future<GeoData> getGeoData(@Path() String ip);
}
