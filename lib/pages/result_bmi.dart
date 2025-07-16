import 'package:flutter/material.dart';
import 'package:myapp/bmi_controller.dart';
import 'package:provider/provider.dart';

class ResultBMI extends StatelessWidget {
  const ResultBMI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Consumer<BMIController>(
        builder: (context, bmiController, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your BMI Result",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: bmiController
                        .getBMIColor()
                        .withAlpha((255 * 0.1).round()),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: bmiController.getBMIColor(),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        bmiController.bmiValue.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: bmiController.getBMIColor(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bmiController.bmi,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: bmiController.getBMIColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    bmiController.getBMIDescription(),
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Calculate Again",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "BMI Categories:\n"
                  "• Underweight: < 18.5\n"
                  "• Normal: 18.5 - 24.9\n"
                  "• Overweight: 25.0 - 29.9\n"
                  "• Obese: 30.0 - 34.9\n"
                  "• Very Obese: ≥ 35.0",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
