import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/second_page.dart';

class RadarController extends GetxController {
  final RxInt redValue = 0.obs;
  final RxInt blueValue = 0.obs;
  final RxInt greenValue = 0.obs;
  final RxInt totalTextFields = 0.obs;
  List<TextEditingController> redTextControllers = [];
  List<TextEditingController> blueTextControllers = [];
  List<TextEditingController> greenTextControllers = [];
  final RxBool redControllerStatus = false.obs;
  final RxBool blueControllerStatus = false.obs;
  final RxBool greenControllerStatus = false.obs;

  void addColor(final String colorName) {
    switch (colorName) {
      case "red":
        redValue.value++;
        totalTextFields.value++;
        setTextControllers("red");
        break;
      case "blue":
        blueValue.value++;
        totalTextFields.value++;
        setTextControllers("blue");
        break;
      case "green":
        greenValue.value++;
        totalTextFields.value++;
        setTextControllers("green");
        break;
      default:
    }
  }

  void removeColor(final String colorName) {
    switch (colorName) {
      case "red":
        if (redValue.value > 0) {
          redValue.value--;
        }
        if (redValue.value >= 0) {
          totalTextFields.value--;
        }
        removeTextControllers("red");
        break;
      case "blue":
        if (blueValue.value > 0) {
          blueValue.value--;
        }
        if (blueValue.value >= 0) {
          totalTextFields.value--;
        }
        removeTextControllers("blue");
        break;
      case "green":
        if (greenValue.value > 0) {
          greenValue.value--;
        }
        if (greenValue.value >= 0) {
          totalTextFields.value--;
        }
        removeTextControllers("green");
        break;
      default:
    }
  }

  void setTextControllers(final String colorName) {
    switch (colorName) {
      case "red":
        for (int i = 1; i <= redValue.value; i++) {
          if (redValue.value != redTextControllers.length) {
            redTextControllers.add(TextEditingController());
          }
        }
        break;
      case "blue":
        for (int i = 1; i <= blueValue.value; i++) {
          if (blueValue.value != blueTextControllers.length) {
            blueTextControllers.add(TextEditingController());
          }
        }
        break;
      case "green":
        for (int i = 1; i <= greenValue.value; i++) {
          if (greenValue.value != greenTextControllers.length) {
            greenTextControllers.add(TextEditingController());
          }
        }
        break;
      default:
    }
  }

  void removeTextControllers(final String colorName) {
    switch (colorName) {
      case "red":
        redTextControllers.removeLast();

        break;
      case "blue":
        blueTextControllers.removeLast();

        break;
      case "green":
        greenTextControllers.removeLast();

        break;
      default:
    }
  }

  TextEditingController? setTextControllerToFields(
    final String colorName,
    final int itemIndex,
  ) {
    switch (colorName) {
      case "red":
        return redTextControllers[itemIndex];
      case "blue":
        return blueTextControllers[itemIndex];
      case "green":
        return greenTextControllers[itemIndex];
    }
    return null;
  }

  void checkTextFieldControllersStatus() {
    if (redTextControllers.isNotEmpty) {
      redControllerStatus.value = redTextControllers.every(
        (final controller) => controller.text.isNotEmpty,
      );
    } else {
      redControllerStatus.value = true;
    }
    if (blueTextControllers.isNotEmpty) {
      blueControllerStatus.value = blueTextControllers.every(
        (final controller) => controller.text.isNotEmpty,
      );
    } else {
      blueControllerStatus.value = true;
    }

    if (greenTextControllers.isNotEmpty) {
      greenControllerStatus.value = greenTextControllers.every(
        (final controller) => controller.text.isNotEmpty,
      );
    } else {
      greenControllerStatus.value = true;
    }

    if (redControllerStatus.value &&
        blueControllerStatus.value &&
        greenControllerStatus.value &&
        totalTextFields.value > 0) {
      Get.to(() => const SecondPage());
    } else {
      const snackBar = SnackBar(
        content: Text(
          'لطفا تمامی مقادیر را پر کنید',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    }
  }

  List<Text>? getRedTextEditingControllersValues() {
    if (redTextControllers.isNotEmpty) {
      return redTextControllers
          .map(
            (final e) => Text(
              e.text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
          .toList();
    }
    return null;
  }

  List<Text>? getBlueTextEditingControllersValues() {
    if (blueTextControllers.isNotEmpty) {
      return blueTextControllers
          .map(
            (final e) => Text(
              e.text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
          .toList();
    }
    return null;
  }

  List<Text>? getGreenTextEditingControllersValues() {
    if (greenTextControllers.isNotEmpty) {
      return greenTextControllers
          .map(
            (final e) => Text(
              e.text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
          .toList();
    }
    return null;
  }
}
