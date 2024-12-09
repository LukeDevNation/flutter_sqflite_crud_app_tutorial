import 'package:crud_sqflite/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonDeleteUserWidget extends StatelessWidget {
  // ID of the user to be deleted
  final int userId;

  const ButtonDeleteUserWidget({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    // Access the HomeViewModel instance from the Provider
    final viewModel = context.watch<HomeViewModel>();

    // Function to show a confirmation dialog before deleting a user
    Future<void> confirmDelete(int id) async {
      // Display a dialog box to confirm deletion
      final result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Deletion'),
            content: const Text('Are you sure you want to delete this user?'),
            actions: [
              // Cancel button: closes the dialog without deleting
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              // Confirm button: closes the dialog and confirms deletion
              ElevatedButton(
                child: const Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );

      // If the user confirmed, call the delete method in the ViewModel
      if (result == true) {
        await viewModel.deleteUser(id);
      }
    }

    // Returns a delete icon button with a red color
    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.redAccent),
      // Trigger the confirmation dialog when the button is pressed
      onPressed: () => confirmDelete(userId),
    );
  }
}
