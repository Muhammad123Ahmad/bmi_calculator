import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectWeight extends StatefulWidget {
  const SelectWeight({super.key});

  @override
  State<SelectWeight> createState() => _SelectWeightState();
}

class _SelectWeightState extends State<SelectWeight> {
  double _sliderValue = 66.0;
  double? bmi;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * 0.07),
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 30),
            child: Text(
              'Select Weight',
              style: TextStyle(
                  color: Color(0xff203354),
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 4),
            child: Text(
              'Drag the purple toggle',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          // Use Stack to keep the image centered while scaling
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assest/person.png', // Make sure your path is correct
                    height: _sliderValue * 2,
                    width: _sliderValue * 2, // Change the width proportionally
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          // Slider for adjusting weight
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Slider(
              value: _sliderValue,
              min: 66.0,
              max: 270.0,
              divisions: 204,
              label: _sliderValue.toStringAsFixed(1) + ' pounds',
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.07),
          Center(
            child: GestureDetector(
              onTap: () async {
                var prefs = await SharedPreferences.getInstance();
                await prefs.setDouble('Weight', _sliderValue);

                final double? height = prefs.getDouble('Height');
                final double? weight = prefs.getDouble('Weight');

                bmi = calculateBMI(height!, weight!);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Result(bmi: bmi!)));
              },
              child: Container(
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.7,
                  decoration: BoxDecoration(
                      color: const Color(0xff203354),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
        ],
      ),
    );
  }

  double calculateBMI(double height, double weight) {
    if (height == 0) return 0;

    return 703 * (weight / (height * height));
  }
}
