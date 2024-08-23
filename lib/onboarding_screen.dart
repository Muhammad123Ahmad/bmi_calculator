import 'package:bmi_calculator/select_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            child: Image.asset(
              'assest/doctor.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: screenHeight * 0.5,
              left: 0,
              right: 0,
              child: Container(
                  height: screenHeight,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(222, 89, 149, 209),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 50, left: 40),
                        child: Text(
                          'Track your health \n for a healthy life.',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25, left: 40),
                        child: Text(
                          'Calculate your Body Mass Index (BMI) based on the relevant information on body weight,\nheight and gender.',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 40, left: 40),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SelectHeight()));
                            },
                            child: Container(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.5,
                                decoration: BoxDecoration(
                                    color: const Color(0xff203354),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      'Get Started',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          )),
                    ],
                  )))
        ],
      ),
    );
  }
}
