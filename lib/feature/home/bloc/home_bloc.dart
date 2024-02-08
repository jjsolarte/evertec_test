import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:evertec_test/feature/home/bloc/home_state.dart';
import 'package:evertec_test/feature/home/repository/home_repository.dart';
import 'package:evertec_test/feature/home/service/home_service.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository =
      HomeRepositoryImpl(homeService: HomeServiceImpl(dio: Dio()));

  final homeState =  const HomeState();

  HomeBloc() : super(const HomeState()) {

    on<HomeGetDeviceEvent>((event, emit) async {
      final deviceInfo = await _homeRepository.getDeviceInfo();
      if (deviceInfo != null) {
        emit(homeState.copyWith(deviceInfo: deviceInfo));
      } else {
        emit(state.copyWith(deviceInfo: null));
      }
    });

    on<HomeGetCovidInfoEvent>((event, emit) async {
      final covidInfo = await _homeRepository.getCovidInfo();
      if (covidInfo != null) {
        emit(homeState.copyWith(covidInfo: covidInfo));
      } else {
        emit(state.copyWith(covidInfo: null));
      }
    });
  }
}
