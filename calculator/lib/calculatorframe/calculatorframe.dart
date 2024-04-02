import 'package:calculator/inputbuttons/inputbuttons.dart';
import 'package:calculator/inputscreen/calculationscreen.dart';
import 'package:calculator/inputscreen/inputscreen.dart';
import 'package:calculator/themes/themebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorFrame extends StatelessWidget {
  const CalculatorFrame({
    super.key,
    required this.inputController,
    required this.calculationScreenController,
    required this.inputProcessor,
    required this.changeTheme,
  });

  final TextEditingController inputController;
  final TextEditingController calculationScreenController;

  final void Function({required String value}) inputProcessor;
  final void Function(
    String,
    String,
  ) changeTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // UPPER
        Row(
          children: [
            // THEME BUTTON
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 125,
                child: ThemeButton(changeTheme: changeTheme),
              ),
            ),

            // INPUT SCREEN
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: InputScreen(
                  inputController: inputController,
                ),
              ),
            )
          ],
        ),

        // MIDDLE
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 120,
                child: CalculationScreen(
                  calculationScreenController: calculationScreenController,
                ),
              ),
            ),
          ],
        ),
        // LOWER
        Row(
          children: [
            // BUTTONS
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                child: InputButtons(
                  inputController: inputController,
                  inputProcessor: inputProcessor,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
