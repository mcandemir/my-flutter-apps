import 'package:flutter/material.dart';

const buttons = [
  ['AC', 'C', '+/-', '/'],
  ['7', '8', '9', 'x'],
  ['4', '5', '6', '-'],
  ['1', '2', '3', '+'],
  ['0', '.', '%', '='],
];

class InputButtons extends StatelessWidget {
  const InputButtons({
    super.key,
    required this.inputController,
    required this.inputProcessor,
  });

  final TextEditingController inputController;

  final void Function({required String value}) inputProcessor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...buttons.map((row) {
          return Row(
            children: [
              ...row.map((btn) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: ElevatedButton(
                            onPressed: () {
                              inputProcessor(value: btn);
                            },
                            child: Text(btn)),
                      ),
                    ),
                  ))
            ],
          );
        }),
      ],
    );

    // OutlinedButton(
    //   onPressed: () {},
    //   child: Text('inputbuttons'),
    // );
  }
}
