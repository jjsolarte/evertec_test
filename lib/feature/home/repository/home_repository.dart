import 'package:evertec_test/feature/home/model/covid_info_model.dart';
import 'package:evertec_test/feature/home/model/device_info_model.dart';
import 'package:evertec_test/feature/home/service/home_service.dart';

abstract class HomeRepository {
  Future<DeviceInfoModel?> getDeviceInfo();
  Future<CovidInfoModel?> getCovidInfo();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required HomeService homeService})
      : _homeService = homeService;

  final HomeService _homeService;

  @override
  Future<DeviceInfoModel?> getDeviceInfo() async {
    try {
      final response = await _homeService.getDeviceInfo();
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<CovidInfoModel?> getCovidInfo() async{
    try {
      final response = await _homeService.getCovidInfo();
      return response;
    } catch (e) {
      return null;
    }
  }
}
