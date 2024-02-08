import 'package:flutter/material.dart';

class AppLoginWidget extends StatelessWidget {
  const AppLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/image/female.webp'),
      const Positioned(
        bottom: 20,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido a:',
              style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Evertec',
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      )
    ]);
  }
}
