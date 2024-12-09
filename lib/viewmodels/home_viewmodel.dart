import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

class HomeViewModel extends ChangeNotifier {
  // Instance of DatabaseService to interact with the database
  final DatabaseService _dbService = DatabaseService();

  // List to store user data
  List<UserModel> _users = [];

  // Getter to access the list of users
  List<UserModel> get users => _users;

  // Method to fetch users from the database
  Future<void> fetchUsers() async {
    _users =
        await _dbService.getAllUsers(); // Fetch the users from the database
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to add a new user to the database
  Future<void> addUser(String name, int age, String phoneNumber) async {
    // Add a new user using the DatabaseService
    await _dbService.addUser(
      UserModel(name: name, age: age, phoneNumber: phoneNumber),
    );
    await fetchUsers(); // Refresh the list of users after adding a new user
  }

  // Method to update an existing user in the database
  Future<void> updateUser(
      int id, String name, int age, String phoneNumber) async {
    // Validate the data before updating
    if (id <= 0 || name.isEmpty || phoneNumber.isEmpty || age <= 0) {
      // If invalid data, print an error message (can be handled differently)
      // ignore: avoid_print
      print('Invalid data for updating user.');
      return;
    }

    // Update the user in the database
    await _dbService.updateUser(
      UserModel(id: id, name: name, age: age, phoneNumber: phoneNumber),
    );
    await fetchUsers(); // Refresh the list of users after updating
  }

  // Method to delete a user from the database
  Future<void> deleteUser(int id) async {
    await _dbService.deleteUser(id); // Delete the user from the database
    await fetchUsers(); // Refresh the list of users after deletion
  }
}
