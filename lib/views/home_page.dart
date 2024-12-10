import 'package:crud_sqflite/views/widgets/add_user.dart';
import 'package:crud_sqflite/views/widgets/delete_user.dart';
import 'package:crud_sqflite/views/widgets/edit_user.dart';
import 'package:crud_sqflite/views/widgets/input_age.dart';
import 'package:crud_sqflite/views/widgets/input_name.dart';
import 'package:crud_sqflite/views/widgets/input_phone.dart';
import 'package:crud_sqflite/views/widgets/text_presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  // Controllers to manage the text input fields for name, age, and phone.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the HomeViewModel to manage user data and state.
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      // Sets the background color of the app.
      backgroundColor: const Color.fromARGB(137, 3, 122, 102),
      appBar: AppBar(
        title: const Text(
          'CRUD Example',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //const SizedBox(height: 10), // Spacing at the top.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: const Color.fromARGB(255, 2, 110, 96),
                elevation: 4, // Adds shadow for depth.
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title widget at the top of the form.
                      const TextCustom(),
                      const SizedBox(height: 12),
                      // Input field for the name.
                      InputNameWidget(nameController: _nameController),
                      const SizedBox(height: 12),
                      // Input field for the age.
                      InputAgeWidget(ageController: _ageController),
                      const SizedBox(height: 12),
                      // Input field for the phone number.
                      InputPhoneWidget(phoneController: _phoneController),
                      const SizedBox(height: 16),
                      // Button to add a new user with the entered details.
                      ButtonAddUserWidget(
                        nameController: _nameController,
                        ageController: _ageController,
                        phoneController: _phoneController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Section to display the list of users.
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 7.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: const Color.fromARGB(255, 1, 126, 131),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        ' List of Registered Users:',
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(214, 255, 255, 255),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      // Dynamically builds a list of users from the ViewModel.
                      itemCount: viewModel.users.length,
                      itemBuilder: (context, index) {
                        final user = viewModel.users[index];
                        return Card(
                          color: const Color.fromARGB(184, 58, 70, 71),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: Text(
                                // Displays the first letter of the user's name.
                                user.name[0].toUpperCase(),
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            // Displays the user's name in bold.
                            title: Text(
                              user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 206, 140, 17),
                              ),
                            ),
                            // Displays the user's age and phone number.
                            subtitle: Text(
                              'Age: ${user.age}\nPhone: ${user.phoneNumber}',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Button to edit user details.
                                ButtonUpdateUserWidget(userData: user.toMap()),
                                // Button to delete the user.
                                ButtonDeleteUserWidget(userId: user.id!),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
