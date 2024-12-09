import 'package:crud_sqflite/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonAddUserWidget extends StatelessWidget {
  // Controllers to receive user input for name, age, and phone.
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController phoneController;

  const ButtonAddUserWidget(
      {super.key,
      required this.nameController,
      required this.ageController,
      required this.phoneController});

  // Shows an error dialog with a provided message.
  Future<void> _showErrorDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'), // Dialog title for errors.
          content: Text(message), // Displays the error message.
          actions: [
            // Closes the dialog when "OK" is pressed.
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Access the ViewModel to handle user-related operations.
    final viewModel = context.watch<HomeViewModel>();
    return Center(
      child: SizedBox(
        // Ensures the button spans the full width.
        //width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            // Trimmed user input for name, age, and phone.
            final name = nameController.text.trim();
            final ageText = ageController.text.trim();
            final phone = phoneController.text.trim();

            // Validate the name (no numbers or special characters).
            final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
            if (!nameRegex.hasMatch(name)) {
              // Show error if invalid.
              await _showErrorDialog(context, 'Enter the Name.');
              return;
            }

            // Validate the age (positive integer).
            final age = int.tryParse(ageText);
            if (age == null || age <= 0) {
              // Show error if invalid.
              await _showErrorDialog(context, 'Enter the Age.');
              return;
            }

            // Validate the phone number (only digits).
            final phoneRegex = RegExp(r'^\d+$');
            if (!phoneRegex.hasMatch(phone)) {
              // Show error if invalid.
              await _showErrorDialog(context, 'Enter the Phone Number.');
              return;
            }

            // Add the user to the database if all inputs are valid.
            await viewModel.addUser(name, age, phone);

            // Clear the input fields after successful submission.
            nameController.clear();
            ageController.clear();
            phoneController.clear();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Button color.
            shape: RoundedRectangleBorder(
              // Rounded corners for the button.
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Add User',
            style: TextStyle(color: Colors.white),
          ), // Button label.
        ),
      ),
    );
  }
}
