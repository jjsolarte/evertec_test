part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeGetDeviceEvent extends HomeEvent {
  const HomeGetDeviceEvent();

  @override
  List<Object?> get props => [];
}

class HomeGetCovidInfoEvent extends HomeEvent {
  const HomeGetCovidInfoEvent();

  @override
  List<Object?> get props => [];
}
