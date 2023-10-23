import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/radar_controller.dart';
import '../widgets/second_page/blue_values_item_ui.dart';
import '../widgets/second_page/green_vlaues_item_ui.dart';
import '../widgets/second_page/red_values_item_ui.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final RadarController radarController = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: radarController.redTextControllers.isNotEmpty,
              child: RedValuesItemUi(radarController: radarController),
            ),
            Visibility(
              visible: radarController.blueTextControllers.isNotEmpty,
              child: BlueValuesItemUi(radarController: radarController),
            ),
            Visibility(
              visible: radarController.greenTextControllers.isNotEmpty,
              child: GreenValuesItemUi(radarController: radarController),
            ),
          ],
        ),
      ),
    );
  }
}
