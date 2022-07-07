import 'dart:math';

import 'package:bmi/constants/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBmi() {
    double heightInMeter = height! / 100;
    // final bmi = weight! / pow(heightInMeter, 2);
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16) {
      category = underweightSevere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overWeight;
    } else if (bmi! < 35) {
      category = obeseI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else if (bmi! >= 40) {
      category = obeseIII;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional definciency and osteoporosis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overWeight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.";
        break;
      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}
