import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNameWidget extends StatelessWidget {
  // The controller to manage the text input for name
  final TextEditingController nameController;

  const InputNameWidget({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // Attach the controller to manage the text input
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'Name', // Label for the input field
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
      // Restricts input to letters and spaces only
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
      ],
      // Suggests the keyboard type optimized for name input
      keyboardType: TextInputType.name,
      style: const TextStyle(
        color: Colors.white, // Text color for dark theme
      ),
      cursorColor: Colors.cyanAccent, // Cursor color for dark mode
    );
  }
}
