import 'package:evertec_test/feature/login/ui/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          )
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(50),
            child: Image.asset('assets/image/covid_image.webp'),
          )),
          const Column(
            children: [
              Text('Loading...'),
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Text('Cargando...'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
