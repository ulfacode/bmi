import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffB388FF);
// const Color primaryColor = Color(0xffe7b9ff);
TextStyle? labelTextStyle = const TextStyle(
  fontSize: 18,
  color: Colors.white, //Color(0xff8d8e98),
);
TextStyle? weightAgeTextStyle = const TextStyle(
  fontSize: 18,
  color: primaryColor, //Color(0xff8d8e98),
);
TextStyle numberTextStyle = const TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const String underweightSevere = "Underweight (Severe thinness)";
const String underweightModerate = "Underweight (Moderate thinness)";
const String underweightMild = "Underweight (Mild thinness)";
const String normal = "Normal";
const String overWeight = "Overweight";
const String obeseI = "Obese Class I";
const String obeseII = "Obese Class II";
const String obeseIII = "Obese Class III";
