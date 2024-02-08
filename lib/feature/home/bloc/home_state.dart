import 'package:equatable/equatable.dart';
import 'package:evertec_test/feature/home/model/covid_info_model.dart';
import 'package:evertec_test/feature/home/model/device_info_model.dart';

class HomeState extends Equatable {
  const HomeState({
    this.deviceInfo,
    this.covidInfo,
  });

  @override
  List<Object?> get props => [deviceInfo, covidInfo];

  final DeviceInfoModel? deviceInfo;
  final CovidInfoModel? covidInfo;

  HomeState copyWith({
    DeviceInfoModel? deviceInfo,
    CovidInfoModel? covidInfo,
  }) =>
      HomeState(
        deviceInfo: deviceInfo ?? this.deviceInfo,
        covidInfo: covidInfo ?? this.covidInfo,
      );

  HomeState copyWithFailure({
    DeviceInfoModel? deviceInfo,
    CovidInfoModel? covidInfo,
  }) =>
      HomeState(
        deviceInfo: deviceInfo ?? this.deviceInfo,
        covidInfo: covidInfo ?? this.covidInfo,
      );
}
