import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/radar_controller.dart';
import '../widgets/first_page/add_remove_row_ui.dart';
import '../widgets/first_page/next_page_button_ui.dart';
import '../widgets/first_page/text_field_item_ui.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final RadarController radarController = Get.put(RadarController());
    return Obx(
      () => Scaffold(
        floatingActionButton: Visibility(
          visible: radarController.totalTextFields.value != 0,
          child: const NextPageButtonUi(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Obx(
          () => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddRemoveRowUi(
                  colorName: 'قرمز',
                  currentValue: radarController.redValue.value,
                  increaseOnTap: () {
                    radarController.addColor("red");
                  },
                  decreaseOnTap: () {
                    radarController.removeColor("red");
                  },
                ),
                AddRemoveRowUi(
                  colorName: 'آبی',
                  currentValue: radarController.blueValue.value,
                  increaseOnTap: () {
                    radarController.addColor("blue");
                  },
                  decreaseOnTap: () {
                    radarController.removeColor("blue");
                  },
                ),
                AddRemoveRowUi(
                  colorName: 'سبز',
                  currentValue: radarController.greenValue.value,
                  increaseOnTap: () {
                    radarController.addColor("green");
                  },
                  decreaseOnTap: () {
                    radarController.removeColor("green");
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFieldItemUi(
                  colorName: "red",
                  radarController: radarController,
                  colorsLength: radarController.redValue.value,
                  backGroundColor: Colors.red.shade200,
                ),
                TextFieldItemUi(
                  colorName: "blue",
                  radarController: radarController,
                  colorsLength: radarController.blueValue.value,
                  backGroundColor: Colors.blue.shade200,
                ),
                TextFieldItemUi(
                  colorName: "green",
                  radarController: radarController,
                  colorsLength: radarController.greenValue.value,
                  backGroundColor: Colors.green.shade200,
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
