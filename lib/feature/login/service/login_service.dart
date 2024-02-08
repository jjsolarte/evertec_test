import 'dart:convert';

import 'package:evertec_test/feature/login/model/evertec_user.dart';
import 'package:flutter/services.dart';

abstract class LoginService {
  Future<List<EvertecUsers>> getLogin(
      {required String name, required String password});
}

class LoginServiceImpl implements LoginService {
  @override
  Future<List<EvertecUsers>> getLogin(
      {required String name, required String password}) async {
    try{
      final String response = await rootBundle.loadString('assets/json/users.json');
      final data = await json.decode(response) as List;
      return List.from(data
          .map((e) => EvertecUsers.fromJson(e as Map<String, dynamic>)));
    }catch(e){
      rethrow;
    }
  }
}
