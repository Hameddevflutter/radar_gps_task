import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/radar_controller.dart';

class NextPageButtonUi extends StatelessWidget {
  const NextPageButtonUi({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Container(
        width: 200,
        margin: const EdgeInsets.only(bottom: 20),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                side: BorderSide(),
              ),
            ),
          ),
          onPressed: () {
            FocusScope.of(context).unfocus();
            final RadarController radarController = Get.find();
            radarController.checkTextFieldControllersStatus();
          },
          child: const Text(
            "صفحه بعد",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      );
}
