import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key, required this.inputController});

  final TextEditingController inputController;

  @override
  State<StatefulWidget> createState() {
    return _InputScreenState();
  }
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputController,
      readOnly: true,
      textAlign: TextAlign.right,
    );

    // OutlinedButton(onPressed: () {}, child: Text('inputscreen'));
  }
}
