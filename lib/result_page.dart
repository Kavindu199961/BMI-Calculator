// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;

  ResultPage(this.bmi);

  @override
  Widget build(BuildContext context) {
    String result = '';
    String imagePath = '';

    if (bmi < 16) {
      result = 'Severe Undernourishment';
      imagePath = 'assets/su.png';
    } else if (bmi <= 16.9) {
      result = 'Medium Undernourishment';
      imagePath = 'assets/mu.png';
    } else if (bmi <= 18.4) {
      result = 'Slight Undernourishment';
      imagePath = 'assets/slu.png';
    } else if (bmi <= 24.9) {
      result = 'Normal nutrition state';
      imagePath = 'assets/nns.png';
    } else if (bmi <= 29.9) {
      result = 'Overweight';
      imagePath = 'assets/ove.png';
    } else if (bmi <= 39.9) {
      result = 'Obesity';
      imagePath = 'assets/obe.png';
    } else {
      result = 'Pathological obesity';
      imagePath = 'assets/pobe.png';
    }

    Color resultColor = Colors.green;
    if (bmi >= 25) {
      resultColor = Colors.red;
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('BMI Result',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            )),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200,
              height: 300,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 23.0),
            Text(
              'Your BMI : ${bmi.toStringAsFixed(2)} kg/m²',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 23.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Result:',
                  style: TextStyle(fontSize: 24, color: resultColor),
                ),
                Text(
                  '$result',
                  style: TextStyle(
                    fontSize: 24,
                    color: resultColor,
                  ),
                ),
                SizedBox(height: 20.0),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      'Back',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
