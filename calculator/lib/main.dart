import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:calculator/themes/colorschemes.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalculatorApp();
  }
}

class _CalculatorApp extends State<CalculatorApp> {
  var _theme = calculatorColorSchemes['cyanTheme'];
  var _darkTheme = calculatorColorSchemes['cyanThemeDark'];

  void changeTheme(String theme, String darkTheme) {
    setState(() {
      _theme = calculatorColorSchemes[theme];
      _darkTheme = calculatorColorSchemes[darkTheme];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: _theme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(colorScheme: _darkTheme),
      home: Scaffold(
        body: Calculator(
          changeTheme: changeTheme,
        ),
      ),
    );
  }
}
