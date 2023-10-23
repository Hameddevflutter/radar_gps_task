import 'package:flutter/material.dart';

import '../../controller/radar_controller.dart';

class GreenValuesItemUi extends StatelessWidget {
  const GreenValuesItemUi({
    required this.radarController,
    super.key,
  });

  final RadarController radarController;

  @override
  Widget build(final BuildContext context) => Container(
        width: 300,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          border: Border.all(width: 2),
        ),
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            children:
                radarController.getGreenTextEditingControllersValues() ?? [],
          ),
        ),
      );
}
