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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text(
          'CRUD Example',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.greenAccent,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titulo Portada
                    const TextCustom(),
                    const SizedBox(height: 12),
                    // Input Name
                    InputNameWidget(nameController: _nameController),
                    const SizedBox(height: 12),
                    // Input Age
                    InputAgeWidget(ageController: _ageController),
                    const SizedBox(height: 12),
                    // Input Phone
                    InputPhoneWidget(phoneController: _phoneController),
                    const SizedBox(height: 16),
                    // Button Add User
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
          Expanded(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: viewModel.users.length,
                  itemBuilder: (context, index) {
                    final user = viewModel.users[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal[100],
                          child: Text(
                            user.name[0].toUpperCase(),
                            style: const TextStyle(color: Colors.teal),
                          ),
                        ),
                        // Prin Name User
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Prin Age and Phone
                        subtitle: Text(
                            'Edad: ${user.age}\nTeléfono: ${user.phoneNumber}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Button UpdateUser
                            ButtonUpdateUserWidget(userData: user.toMap()),
                            // Button Delete
                            ButtonDeleteUserWidget(userId: user.id!),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
