import 'package:evertec_test/feature/home/bloc/home_bloc.dart';
import 'package:evertec_test/feature/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileInfoWidget extends StatefulWidget {
  const MobileInfoWidget({Key? key}) : super(key: key);

  @override
  State<MobileInfoWidget> createState() => _MobileInfoWidgetState();
}

class _MobileInfoWidgetState extends State<MobileInfoWidget> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeGetDeviceEvent());
    super.initState();
  }

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
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.deviceInfo!=null) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateTime.now().toString().substring(10, 19),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateTime.now().toString().substring(0, 10),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Marca: ${state.deviceInfo!.marc}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Modelo: ${state.deviceInfo!.model}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Typo: ${state.deviceInfo!.type}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'OS: ${state.deviceInfo!.operativeSystem}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Lo sentimos, información no disponible'),
                );
              }
            },
          ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.sunny),
                Container(
                  width: 2,
                  height: 60,
                  color: Colors.black,
                ),
                const Icon(Icons.mode_night),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
