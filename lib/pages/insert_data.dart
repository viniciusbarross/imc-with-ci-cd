import 'package:flutter/material.dart';
import 'package:myapp/bmi_controller.dart';
import 'package:provider/provider.dart';

class InsertData extends StatelessWidget {
  InsertData({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "BMI Calculator",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _weightController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please, enter the weight!";
                  }

                  final weight = double.tryParse(value);
                  if (weight == null) {
                    return "Please enter a valid number!";
                  }

                  if (weight <= 0 || weight > 500) {
                    return "Please enter a valid weight (1-500 kg)!";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Weight (kg)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _heightController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please, enter the height!";
                  }

                  final height = double.tryParse(value);
                  if (height == null) {
                    return "Please enter a valid number!";
                  }

                  if (height <= 0 || height > 3.0) {
                    return "Please enter a valid height (0.1-3.0 m)!";
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Height (m)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.height),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<BMIController>(context, listen: false)
                        .calculateBMI(
                            weight: double.parse(_weightController.text),
                            height: double.parse(_heightController.text));

                    Navigator.pushNamed(context, '/result');
                  }
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
                  "Calculate BMI",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enter your weight in kilograms and height in meters to calculate your Body Mass Index (BMI).",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
