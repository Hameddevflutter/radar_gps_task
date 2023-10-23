import 'package:flutter/material.dart';

class AddRemoveRowUi extends StatelessWidget {
  const AddRemoveRowUi({
    required this.colorName,
    required this.currentValue,
    required this.increaseOnTap,
    required this.decreaseOnTap,
    super.key,
  });
  final String colorName;
  final int currentValue;
  final Function() increaseOnTap;
  final Function() decreaseOnTap;

  @override
  Widget build(final BuildContext context) => Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Text(
              colorName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: decreaseOnTap,
              icon: const Icon(
                Icons.remove,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              currentValue.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: increaseOnTap,
              icon: const Icon(
                Icons.add,
                size: 25,
              ),
            ),
          ],
        ),
      );
}
