import 'package:get/get.dart';
import 'package:myapp/model/geo.model.dart';

import '../source/clients/ip.client.dart';

class IpRepositoryImpl implements IpRepository {

  @override
  Future<GeoData> getDataByIp({required String ip}) {
    return Get.find<IpClient>().getGeoData(ip);
  }
}

abstract class IpRepository {
  Future<GeoData> getDataByIp({required String ip});
}