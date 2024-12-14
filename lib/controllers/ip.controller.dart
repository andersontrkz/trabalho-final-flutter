import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myapp/model/geo.model.dart';
import 'package:get/get.dart';
import 'package:myapp/repositories/ip.repository.dart';

class IpController extends GetxController with StateMixin<GeoData>{

  IpController({required this.repository}){
    change(null, status: RxStatus.empty());
  }

  final IpRepository repository;

  Future<GeoData> getGeoIp({String ip = ''}) async {
    change(null, status: RxStatus.loading());

    return repository.getDataByIp(ip: ip);
  }
}