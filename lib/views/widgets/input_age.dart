import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputAgeWidget extends StatelessWidget {
  // The controller to manage the text input for age
  final TextEditingController ageController;

  const InputAgeWidget({super.key, required this.ageController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // Attach the controller to manage the text input
      controller: ageController,
      decoration: InputDecoration(
        // Label for the input field
        labelText: 'Age',
        border: OutlineInputBorder(
          // Rounded border for the input field
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      // Displays a numeric keyboard to the user
      keyboardType: TextInputType.number,
      // Only allows numeric input (no letters or special characters)
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
