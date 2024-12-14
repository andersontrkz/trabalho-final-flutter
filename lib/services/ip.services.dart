import 'package:get/get.dart';
import 'package:myapp/controllers/ip.controller.dart';
import 'package:myapp/model/geo.model.dart';

class IpService extends GetxService {
  final IpController ipController = Get.find();

  Future<GeoData> getGeoIp() async {
    return ipController.getGeoIp();
  }
}
