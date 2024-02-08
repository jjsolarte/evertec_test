import 'package:evertec_test/feature/home/bloc/home_bloc.dart';
import 'package:evertec_test/feature/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidInfoWidget extends StatefulWidget {
  const CovidInfoWidget({Key? key}) : super(key: key);

  @override
  State<CovidInfoWidget> createState() => _CovidInfoWidgetState();
}

class _CovidInfoWidgetState extends State<CovidInfoWidget> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const HomeGetCovidInfoEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.covidInfo!=null) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total casos: ${state.covidInfo!.totalTestResults}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Muertes: ${state.covidInfo!.death}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Casos Confirmados: ${state.covidInfo!.positive}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Pruebas positivas: ${state.covidInfo!.totalTestResultsIncrease}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),Text(
                  'Hospitalizados: ${state.covidInfo!.hospitalized}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      } else {
        return const Text('Lo sentimos, información no disponible');
      }
    });
  }
}
