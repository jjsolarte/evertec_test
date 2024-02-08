import 'package:flutter/material.dart';

class FloatingBottomHomeWidget extends StatelessWidget {
  const FloatingBottomHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.deepOrangeAccent,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
