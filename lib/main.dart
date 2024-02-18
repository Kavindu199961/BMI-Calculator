// ignore_for_file: use_key_in_widget_constructors

import 'package:bmi_calculator/calculator_page.dart';
import 'package:flutter/material.dart';
// Import the HomePage class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorPage(), // Set HomePage as the home page
    );
  }
}
