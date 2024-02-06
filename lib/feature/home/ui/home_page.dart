import 'package:evertec_test/ui/widget/mobile_info_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              Stack(
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
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 80.0, left: 20),
                          child: Text(
                            'Fecha de recolección de datos:',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 150,
                          height: 50,
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
                                  offset:
                                      Offset(2, 2), // Desplazamiento en X e Y
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const Positioned(top: 250, right: 20, child: MobileInfoWidget()),
        ]),
      ),
      floatingActionButton: const CircleAvatar(
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: const ColoredBox(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
