import 'package:bmi_calculator/select_height.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final double bmi;
  const Result({super.key, required this.bmi});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine the BMI category
    String bmiCategory;
    if (widget.bmi < 18.5) {
      bmiCategory = 'Underweight';
    } else if (widget.bmi >= 18.5 && widget.bmi <= 24.9) {
      bmiCategory = 'Normal';
    } else if (widget.bmi >= 25.0 && widget.bmi <= 29.9) {
      bmiCategory = 'Overweight';
    } else if (widget.bmi >= 30.0 && widget.bmi < 40.0) {
      bmiCategory = 'Obese';
    } else if (widget.bmi >= 40.0) {
      bmiCategory = 'Extreme Obese';
    } else {
      bmiCategory = 'Unknown'; // Fallback category
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          const Center(
            child: Text(
              'Result',
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff203354),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          Container(
            height: screenHeight * 0.25,
            width: screenWidth * 0.9,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: const Color(0xff203354),
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(
                'Your BMI is: ${widget.bmi.toStringAsFixed(1)}\n \n Category: $bmiCategory',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.25,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SelectHeight()));
              },
              child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.7,
                  decoration: BoxDecoration(
                      color: const Color(0xff203354),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'New Calculate',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
