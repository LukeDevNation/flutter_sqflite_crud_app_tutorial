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
          title: const Text('Edit Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text field for Name
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              // Text field for Age (only accepts numbers)
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              // Text field for Phone Number
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: [
            // Cancel button: closes the dialog without making changes
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // Save button: triggers the save confirmation dialog
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                // Show a confirmation dialog before applying the changes
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Changes'),
                      content: const Text(
                          'Are you sure you want to modify the data?'),
                      actions: [
                        // Confirm button: applies the changes and closes both dialogs
                        ElevatedButton(
                          child: const Text('Confirm'),
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
                        ),
                        // Cancel button: closes the confirmation dialog without changes
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Button icon for triggering the edit dialog
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.teal),
      onPressed: () =>
          _showEditDialog(context), // Trigger the edit dialog on press
    );
  }
}
