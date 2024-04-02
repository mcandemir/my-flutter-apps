import 'package:calculator/calculatorframe/calculatorframe.dart';
import 'package:flutter/material.dart';

final List<String> _operators = ['/', 'x', '-', '+', '=', '%'];
final List<String> _numbers = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9'
];

List<String> operations = [];
double buffer = 0;
bool isBufferEmpty = true;
bool screenClear = false;
var previousButton = '';

class Calculator extends StatelessWidget {
  Calculator({
    super.key,
    required this.changeTheme,
  });

  final inputController = TextEditingController(text: '');
  final calculationScreenController = TextEditingController(text: '');

  final void Function(
    String,
    String,
  ) changeTheme;

  void inputProcessor({required String value}) {
    // ---
    if (value == 'AC') {
      calculationScreenController.clear();
      inputController.clear();
      operations.clear();
      isBufferEmpty = true;
      buffer = 0;
    }
    // ---
    else if (value == 'C') {
      calculationScreenController.clear();
      if (previousButton == '=') {
        isBufferEmpty = true;
        buffer = 0;
      }
    }
    // ---
    else if (value == '+/-') {
      if (calculationScreenController.text.isNotEmpty) {
        if (calculationScreenController.text[0] == '-') {
          calculationScreenController.text =
              calculationScreenController.text.substring(1);
        } else if (calculationScreenController.text[0] != '-') {
          calculationScreenController.text =
              '-${calculationScreenController.text.substring(0)}';
        }
      }

      if (previousButton == '=') {
        buffer *= -1;
      }
    }
    // ---
    else if (_operators.contains(value)) {
      if (_operators.contains(previousButton)) {
        // add next operation
        operations.clear();
        operations.add(value);
      } else {
        if (operations.isEmpty) operations.add(value);

        // calculation
        if (isBufferEmpty) {
          buffer = double.parse(calculationScreenController.text);
          isBufferEmpty = false;
        } else {
          buffer = calculate(buffer, operations[0],
              double.parse(calculationScreenController.text));
          isBufferEmpty = false;
        }

        // clear screen
        calculationScreenController.clear();

        // format the result string
        if (buffer == buffer.toInt()) {
          calculationScreenController.text += buffer.toInt().toString();
        } else {
          calculationScreenController.text += buffer.toString();
        }

        // clear the screen on next number input
        screenClear = true;

        // add next operation
        operations.clear();
        operations.add(value);
      }
    }
    // ---
    else {
      if (screenClear) {
        calculationScreenController.clear();
        screenClear = false;
      }

      if (previousButton == '=' && _numbers.contains(value)) {
        calculationScreenController.clear();
        inputController.clear();
        buffer = 0;
        isBufferEmpty = true;
      }

      calculationScreenController.text += value;
    }

    // save the last pressed button to the next cycle
    previousButton = value;

    // printout input screen (upper screen)
    if (operations.isNotEmpty) {
      if (isBufferEmpty) {
        inputController.text =
            inputController.text = calculationScreenController.text;
      } else if (operations.contains(previousButton)) {
        inputController.text =
            inputController.text = '$buffer ${operations[0]}';
      } else {
        inputController.text =
            '$buffer ${operations[0]} ${calculationScreenController.text}';
      }
    }

    print('calculationScreenController: ${calculationScreenController.text}');
    print('buffer: $buffer');
    print('operations: $operations');
    print('previous: $previousButton');
  }

  double calculate(double buffer, String operator, double input) {
    switch (operator) {
      case '/':
        buffer = buffer / input;
        break;
      case 'x':
        buffer = buffer * input;
        break;
      case '-':
        buffer = buffer - input;
        break;
      case '+':
        buffer = buffer + input;
        break;
      case '%':
        buffer = buffer % input;
      case '=':
        break;
    }
    return buffer;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      child: CalculatorFrame(
        inputController: inputController,
        calculationScreenController: calculationScreenController,
        inputProcessor: inputProcessor,
        changeTheme: changeTheme,
      ),
    );
  }
}
