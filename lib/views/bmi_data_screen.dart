import 'dart:html';

import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTextStyle!.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      // backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: Center(child: const Text("BMI Calculator")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == "male") ? primaryColor : Colors.white,
                    child:
                        const GenderIconText(title: 'Male', icon: Icons.male),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "female") ? primaryColor : Colors.white,
                      child: const GenderIconText(
                          title: 'Female', icon: Icons.female),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "HEIGHT",
                style: weightAgeTextStyle!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: BmiCard(
                      child: Slider(
                        value: height.toDouble(),
                        min: 80,
                        max: 200,
                        // thumbColor: Colors.red,
                        thumbColor: Color.fromARGB(255, 103, 4, 121),
                        activeColor: Colors.white,
                        onChanged: (value) {
                          height = value.toInt();
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  BmiCard(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 9,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$height",
                            style: numberTextStyle,
                          ),
                          Text(
                            " cm",
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "WEIGHT",
                        style: weightAgeTextStyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: 30),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  weight = val + 20;
                                },
                                children: generateList(20, 220),
                              ),
                            ),
                            // Text(
                            //   "$weight",
                            //   style: numberTextStyle,
                            // ),
                            // const SizedBox(height: 8),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     RawMaterialButton(
                            //       onPressed: () {
                            //         weight += 1;
                            //         setState(() {});
                            //       },
                            //       elevation: 0,
                            //       child: const Icon(
                            //         Icons.add,
                            //         color: primaryColor,
                            //       ),
                            //       shape: const CircleBorder(),
                            //       fillColor: const Color(0xfff3e5f5),
                            //       constraints: const BoxConstraints.tightFor(
                            //         width: 56,
                            //         height: 56,
                            //       ),
                            //     ),
                            //     const SizedBox(width: 10),
                            //     RawMaterialButton(
                            //       onPressed: () {
                            //         weight -= 1;
                            //         setState(
                            //             () {}); //berfungsi menyesuaikan yg muncul dilayar
                            //       },
                            //       elevation: 0,
                            //       child: const Icon(
                            //         Icons.remove,
                            //         color: primaryColor,
                            //       ),
                            //       shape: const CircleBorder(),
                            //       fillColor: const Color(0xfff3e5f5),
                            //       constraints: const BoxConstraints.tightFor(
                            //         width: 56,
                            //         height: 56,
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "AGE",
                        style: weightAgeTextStyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController:
                                    FixedExtentScrollController(initialItem: 5),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  weight = val + 20;
                                },
                                children: generateList(15, 90),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // calculateBmi();
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: bmiCalculator.bmi!,
                    );
                  }),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: const Color(0xffEC3C66),
                color: const Color(0xffB388FF),
              ),
              height: 60,
              child: const Center(
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = const Color(0xffe7b9ff),
    // this.borderColor = const Color.fromARGB(255, 178, 86, 235),
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          // color: const Color.fromARGB(255, 206, 147, 216),
          // color: const Color(0xff272a4E),
          color: const Color(0xffe7b9ff),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor!,
          ),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
