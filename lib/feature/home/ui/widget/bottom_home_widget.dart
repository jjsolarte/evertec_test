import 'package:flutter/material.dart';

class BottomHomeWidget extends StatelessWidget {
  const BottomHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
