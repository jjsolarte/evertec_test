import 'package:flutter/material.dart';

class MobileInfoWidget extends StatelessWidget {
  const MobileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(children: [
        Container(
          width: 350,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, // Color de la sombra
                  blurRadius: 5, // Radio de desenfoque
                  spreadRadius: 2, // Radio de dispersión
                  offset: Offset(2, 2), // Desplazamiento en X e Y
                ),
              ]),
        ),
        Positioned(
            bottom: 0,
            right: 10,
            child: Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.grey,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ))
      ]),
    );
  }
}
