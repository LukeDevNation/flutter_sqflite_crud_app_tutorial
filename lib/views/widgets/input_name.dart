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
        border: OutlineInputBorder(
          // Rounded border for the input field
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      // Restricts input to letters and spaces only
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
      ],
      // Suggests the keyboard type optimized for name input
      keyboardType: TextInputType.name,
    );
  }
}
