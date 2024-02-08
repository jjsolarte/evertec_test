import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evertec_test/feature/login/model/evertec_user.dart';
import 'package:evertec_test/feature/login/repository/login_repository.dart';
import 'package:evertec_test/feature/login/service/login_service.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepositoryImpl loginRepositoryImpl =
      LoginRepositoryImpl(loginService: LoginServiceImpl());

  LoginBloc() : super(LoginInitial()) {
    on<LoginCallEvent>((event, emit) async {
      emit(LoadingState());
      final users = await loginRepositoryImpl.getLogin(
        name: event.name,
        password: event.password,
      );
      if (users != null) {
        EvertecUsers? myUser;
        for(EvertecUsers user in users){
          if(user.name == event.name && user.password == event.password){
            myUser = user;
          }
        }
        if (myUser != null) {
          emit(LoadedState(users: users));
        } else {
          emit(ErrorState());
        }
      } else {
        emit(ErrorState());
      }
    });
  }
}
