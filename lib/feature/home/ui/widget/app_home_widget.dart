import 'package:flutter/material.dart';

class AppHomeWidget extends StatelessWidget {
  const AppHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/image/male.jpg',
                  height: 350,
                ),
                Positioned(
                    right: 20,
                    top: 10,
                    child: IconButton(
                      icon: const Icon(Icons.exit_to_app),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
              ],
            )
          ],
        ),
        Image.asset(
          'assets/image/covid_image.webp',
          width: 200,
        ),
      ],
    );
  }
}
