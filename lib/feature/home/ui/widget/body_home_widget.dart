import 'package:evertec_test/feature/home/bloc/home_bloc.dart';
import 'package:evertec_test/feature/home/bloc/home_state.dart';
import 'package:evertec_test/feature/home/ui/widget/covid_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyHomeWidget extends StatelessWidget {
  const BodyHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                padding: EdgeInsets.only(top: 60.0, left: 20),
                child: Text(
                  'Fecha de recolección de datos:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.covidInfo!=null) {
                      return Text(
                        state.covidInfo!.dateChecked,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      );
                    }else{
                      return const Text('Lo sentimos, información no disponible');
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
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
                child: const CovidInfoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
