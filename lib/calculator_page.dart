// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        elevation: 0,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/bmir.png',
              height: 300,
              width: 300,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      String heightText = heightController.text.trim();
                      String weightText = weightController.text.trim();

                      if (heightText.isEmpty || weightText.isEmpty) {
                        _showErrorDialog(
                            context, 'Please enter both height and weight.');
                        return;
                      }

                      double? height;
                      double? weight;

                      try {
                        height = double.parse(heightText);
                        weight = double.parse(weightText);
                      } catch (e) {
                        _showErrorDialog(context,
                            'Please enter valid numerical values for height and weight.');
                        return;
                      }

                      if (height <= 0 || weight <= 0) {
                        _showErrorDialog(context,
                            'Height and weight must be greater than zero.');
                        return;
                      }

                      double bmi = weight / ((height / 100) * (height / 100));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(bmi),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 17),
                    ),
                    child: Text(
                      'Calculate Your BMI',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: AlertDialog(
              title: Text(
                'Error',
                style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
              ),
              content: Text(
                message,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
