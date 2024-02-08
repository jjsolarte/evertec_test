part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginCallEvent extends LoginEvent {
  const LoginCallEvent({required this.name, required this.password});

  final String name, password;

  @override
  List<Object?> get props => [name, password];
}
