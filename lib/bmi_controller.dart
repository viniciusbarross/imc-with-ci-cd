import 'package:flutter/material.dart';
import 'package:myapp/config.dart';

class BMIController extends ChangeNotifier {
  String _bmi = results[0];
  double _bmiValue = 0.0;
  
  String get bmi => _bmi;
  double get bmiValue => _bmiValue;

  void calculateBMI({required double weight, required double height}) {
    _bmiValue = weight / (height * height);

    if (_bmiValue < 18.5) {
      _bmi = results[1];
    } else if (_bmiValue < 24.9) {
      _bmi = results[2];
    } else if (_bmiValue < 29.9) {
      _bmi = results[3];
    } else if (_bmiValue < 34.9) {
      _bmi = results[4];
    } else {
      _bmi = results[5];
    }

    notifyListeners();
  }
  
  String getBMIDescription() {
    switch (_bmi) {
      case "THINESS":
        return "You are underweight. Consider consulting a healthcare professional for advice on healthy weight gain.";
      case "NORMAL":
        return "You have a normal weight. Keep maintaining a healthy lifestyle!";
      case "OVERWEIGHT":
        return "You are overweight. Consider a balanced diet and regular exercise.";
      case "OBESE":
        return "You are obese. It's recommended to consult a healthcare professional for guidance.";
      case "VERY OBESE":
        return "You are severely obese. Please consult a healthcare professional immediately.";
      default:
        return "Enter your data to calculate your BMI.";
    }
  }
  
  Color getBMIColor() {
    switch (_bmi) {
      case "THINESS":
        return Colors.blue;
      case "NORMAL":
        return Colors.green;
      case "OVERWEIGHT":
        return Colors.orange;
      case "OBESE":
        return Colors.red;
      case "VERY OBESE":
        return Colors.red.shade900;
      default:
        return Colors.grey;
    }
  }
}

