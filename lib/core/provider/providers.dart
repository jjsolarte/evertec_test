import 'package:evertec_test/feature/home/bloc/home_bloc.dart';
import 'package:evertec_test/feature/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProviders {
  static final myProviders = [
    BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
    BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
  ];
}
