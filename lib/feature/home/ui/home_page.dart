import 'package:evertec_test/feature/home/ui/widget/app_home_widget.dart';
import 'package:evertec_test/feature/home/ui/widget/body_home_widget.dart';
import 'package:evertec_test/feature/home/ui/widget/bottom_home_widget.dart';
import 'package:evertec_test/feature/home/ui/widget/floating_buttom_home_widget.dart';
import 'package:evertec_test/ui/widget/mobile_info_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              AppHomeWidget(),
              BodyHomeWidget(),
            ],
          ),
          Positioned(top: 250, right: 20, child: MobileInfoWidget()),
        ]),
      ),
      floatingActionButton: FloatingBottomHomeWidget(),
      bottomNavigationBar: BottomHomeWidget(),
    );
  }
}
