import 'package:evertec_test/feature/login/model/evertec_user.dart';
import 'package:evertec_test/feature/login/service/login_service.dart';

abstract class LoginRepository {
  Future<List<EvertecUsers>?> getLogin(
      {required String name, required String password});
}

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required LoginService loginService}) : _loginService = loginService;

  final LoginService _loginService;

  @override
  Future<List<EvertecUsers>?> getLogin(
      {required String name, required String password}) async {
    try {
      final response =
          await _loginService.getLogin(name: name, password: password);
      return response;
    } catch (e) {
      return null;
    }
  }
}
