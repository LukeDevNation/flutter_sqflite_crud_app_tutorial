import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPhoneWidget extends StatelessWidget {
  // The controller to manage the text input for the phone number
  final TextEditingController phoneController;

  const InputPhoneWidget({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      // Attach the controller to manage the text input
      controller: phoneController,
      decoration: InputDecoration(
        labelText: 'Phone', // Label for the input field
        border: OutlineInputBorder(
          // Rounded border for the input field
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      // Display a numeric keyboard for phone number input
      keyboardType: TextInputType.number,
      // Restrict input to numbers only
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
