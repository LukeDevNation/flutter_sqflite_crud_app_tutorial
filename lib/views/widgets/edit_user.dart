import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/home_viewmodel.dart';

class ButtonUpdateUserWidget extends StatelessWidget {
  // The user data passed to the widget, used to pre-fill the text fields
  final Map<String, dynamic> userData;

  const ButtonUpdateUserWidget({super.key, required this.userData});

  // Function to show the edit dialog where the user can modify their details
  Future<void> _showEditDialog(BuildContext context) async {
    // Controllers to manage the text input for each field
    final nameController = TextEditingController(text: userData['Name']);
    final ageController =
        TextEditingController(text: userData['Age'].toString());
    final phoneController =
        TextEditingController(text: userData['PhoneNumber']);
    // Access the ViewModel to update user data
    final viewModel = context.read<HomeViewModel>();

    // Show the dialog to edit user details
    await showDialog(
      context: context,
      // Prevent dismissing the dialog by tapping outside
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Edit Data',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text field for Name
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  // Dark background for text fields.
                  fillColor: Colors.transparent,
                ),
                // Text color inside text field.
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              // Text field for Age (only accepts numbers)
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  // Dark background for text fields.
                  fillColor: Colors.transparent,
                ),
                keyboardType: TextInputType.number,
                // Text color inside text field.
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              // Text field for Phone Number
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  // Dark background for text fields.
                  fillColor: Colors.transparent,
                ),
                // Text color inside text field.
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            // Cancel button: closes the dialog without making changes
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.tealAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // Save button: triggers the save confirmation dialog
            ElevatedButton(
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.black87),
              ),
              onPressed: () {
                // Show a confirmation dialog before applying the changes
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 2, 61, 63),
                      title: const Text(
                        'Confirm Changes',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: const Text(
                        'Are you sure you want to modify the data?',
                        style: TextStyle(color: Colors.white70),
                      ),
                      actions: [
                        // Cancel button: closes the confirmation dialog without changes
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.tealAccent),
                          child: const Text('Cancel'),
                        ),
                        // Confirm button: applies the changes and closes both dialogs
                        ElevatedButton(
                          onPressed: () {
                            // Update the user data using the ViewModel
                            viewModel.updateUser(
                              userData['id'], // Pass user id
                              nameController.text, // New name
                              int.tryParse(ageController.text) ?? 0, // New age
                              phoneController.text, // New phone number
                            );
                            Navigator.of(context)
                                .pop(); // Close the confirmation dialog
                            Navigator.of(context)
                                .pop(); // Close the edit dialog
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black87),
                          child: const Text('Confirm'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
          backgroundColor: const Color(0xFF121212),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Button icon for triggering the edit dialog
    return IconButton(
      icon: const Icon(Icons.edit, color: Color.fromARGB(255, 211, 164, 9)),
      onPressed: () =>
          _showEditDialog(context), // Trigger the edit dialog on press
    );
  }
}
