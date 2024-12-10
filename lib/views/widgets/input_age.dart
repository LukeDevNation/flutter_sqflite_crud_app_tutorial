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
        labelStyle: const TextStyle(
          color: Colors.white70, // Lighter color for labels in dark mode
        ),
        border: OutlineInputBorder(
          // Rounded border for the input field
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          // Border when the field is not focused
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          // Border when the field is focused
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.cyanAccent),
        ),
        filled: true, // Enables a filled background
        fillColor: Colors.black45, // Background color for dark theme
      ),
      // Displays a numeric keyboard to the user
      keyboardType: TextInputType.number,
      // Only allows numeric input (no letters or special characters)
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(
        color: Colors.white, // Text color for dark theme
      ),
      cursorColor: Colors.cyanAccent, // Cursor color for dark mode
    );
  }
}
