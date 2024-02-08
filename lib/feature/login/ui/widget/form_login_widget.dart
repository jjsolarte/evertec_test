import 'package:evertec_test/core/validators/text_validators.dart';
import 'package:evertec_test/feature/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({Key? key}) : super(key: key);

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _documentController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obsurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Número de documento',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _documentController,
                  validator: (_) => TextValidators.textFieldValidator(
                      _documentController.text),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Stack(children: [
                  TextFormField(
                    controller: _passwordController,
                    validator: (_) => TextValidators.textFieldValidator(
                        _passwordController.text),
                    obscureText: _obsurePassword,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  Positioned(
                      right: 10,
                      top: 15,
                      child: InkWell(
                          onTap: () {
                            setState(() {});
                            _obsurePassword = !_obsurePassword;
                          },
                          child: const Icon(Icons.lock)))
                ]),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
            ),
            onPressed: onLogin,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          InkWell(
              onTap: () => Fluttertoast.showToast(
                    msg: 'Registrar Usuario',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                  ),
              child: const Text('Registrar usuario')),
        ],
      ),
    );
  }

  void onLogin() {
    if (!_formKey.currentState!.validate()) return;
    FocusManager.instance.primaryFocus?.unfocus();
    context.read<LoginBloc>().add(LoginCallEvent(
        name: _documentController.text, password: _passwordController.text));
    _documentController.clear();
    _passwordController.clear();
  }
}
