import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:evertec_test/core/constants/api_constants.dart';
import 'package:evertec_test/feature/home/model/covid_info_model.dart';
import 'package:evertec_test/feature/home/model/device_info_model.dart';

abstract class HomeService {
  Future<DeviceInfoModel> getDeviceInfo();

  Future<CovidInfoModel> getCovidInfo();
}

class HomeServiceImpl implements HomeService {
  HomeServiceImpl({required this.dio});

  final Dio dio;

  @override
  Future<DeviceInfoModel> getDeviceInfo() async {
    late DeviceInfoModel deviceInfoModel;
    try {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceInfoModel = DeviceInfoModel(
            marc: androidInfo.manufacturer!,
            model: androidInfo.model!,
            deviceType: androidInfo.device!,
            type: androidInfo.type!,
            operativeSystem: androidInfo.version.baseOS!);
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceInfoModel = DeviceInfoModel(
          marc: 'Apple',
          model: iosInfo.model!,
          deviceType: iosInfo.name!,
          type: 'Phone',
          operativeSystem: iosInfo.systemName!,
        );
      }
      return deviceInfoModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CovidInfoModel> getCovidInfo() async {
    try {
      final res = await dio
          .get(ApiConstants.covidInfoApi)
          .timeout(const Duration(seconds: 60));
      final listResponse = res.data as List;
      final covidInfo = CovidInfoModel.fromJson(listResponse.first as Map<String, dynamic>);
      return covidInfo;
    } catch (e) {
      rethrow;
    }
  }
}
