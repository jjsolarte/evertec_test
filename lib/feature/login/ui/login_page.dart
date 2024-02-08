import 'package:evertec_test/feature/home/ui/home_page.dart';
import 'package:evertec_test/feature/login/bloc/login_bloc.dart';
import 'package:evertec_test/feature/login/ui/widget/app_login_widget.dart';
import 'package:evertec_test/feature/login/ui/widget/bottom_login_widget.dart';
import 'package:evertec_test/feature/login/ui/widget/form_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoadedState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
        if(state is ErrorState){
          Fluttertoast.showToast(
            msg: 'Credenciales inválidas',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
          );
        }
      },
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [AppLoginWidget(), FormLoginWidget()],
          ),
        ),
        bottomNavigationBar: BottomLoginWidget(),
      ),
    );
  }
}
