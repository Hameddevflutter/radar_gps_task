import 'package:flutter/material.dart';

import '../../controller/radar_controller.dart';

class TextFieldItemUi extends StatelessWidget {
  const TextFieldItemUi({
    required this.radarController,
    required this.backGroundColor,
    required this.colorsLength,
    required this.colorName,
    super.key,
  });

  final RadarController radarController;
  final Color backGroundColor;
  final int colorsLength;
  final String colorName;

  @override
  Widget build(final BuildContext context) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: colorsLength,
        itemBuilder: (final BuildContext context, final int index) => Container(
          width: 300,
          color: backGroundColor,
          margin: const EdgeInsets.all(5),
          child: TextFormField(
            textAlign: TextAlign.center,
            controller:
                radarController.setTextControllerToFields(colorName, index),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.zero,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.zero,
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
}
