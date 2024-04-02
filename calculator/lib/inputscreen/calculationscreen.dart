import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({
    super.key,
    required this.calculationScreenController,
  });

  final TextEditingController calculationScreenController;

  @override
  State<StatefulWidget> createState() {
    return _InputScreenState();
  }
}

class _InputScreenState extends State<CalculationScreen> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.calculationScreenController,
      readOnly: true,
      textAlign: TextAlign.right,
      style: const TextStyle(fontSize: 48),
      decoration:
          const InputDecoration(prefix: Text('='), border: InputBorder.none),
    );

    // OutlinedButton(onPressed: () {}, child: Text('inputscreen'));
  }
}
