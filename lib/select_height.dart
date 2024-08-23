import 'package:bmi_calculator/select_weight.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectHeight extends StatefulWidget {
  const SelectHeight({super.key});

  @override
  State<SelectHeight> createState() => _SelectHeightState();
}

class _SelectHeightState extends State<SelectHeight> {
  double _sliderValue = 50.0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.07,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: Text(
                'Select Height',
                style: TextStyle(
                    color: Color(0xff203354),
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 4),
              child: Text(
                'Drag down the purple toggle',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),

            SizedBox(
              height: screenHeight * 0.1,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image centered with a fixed width and adjustable height
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assest/person.png', // Make sure your path is correct
                        height: _sliderValue * 5,
                        width: 300, // Fixed width
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Horizontal slider on the right side of the screen
                  Container(
                    height: 300,
                    width: 100, // Height of the slider area
                    child: RotatedBox(
                      quarterTurns:
                          1, // Rotate the slider to make it horizontal
                      child: Slider(
                        value: _sliderValue,
                        min: 50.0,
                        max: 100.0,
                        divisions: 90,
                        label: _sliderValue.toStringAsFixed(1) + 'inches',
                        onChanged: (double value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Image that changes size based on slider value
            SizedBox(
              height: screenHeight * 0.12,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  var prefs = await SharedPreferences.getInstance();
                  await prefs.setDouble('Height', _sliderValue);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SelectWeight()));
                },
                child: Container(
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                        color: const Color(0xff203354),
                        borderRadius: BorderRadius.circular(40)),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
