import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

class HomeViewModel extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  Future<void> fetchUsers() async {
    _users = await _dbService.getAllUsers();
    notifyListeners();
  }

  Future<void> addUser(String name, int age, String phoneNumber) async {
    await _dbService.addUser(
      UserModel(name: name, age: age, phoneNumber: phoneNumber),
    );
    await fetchUsers();
  }

  Future<void> updateUser(
      int id, String name, int age, String phoneNumber) async {
    await _dbService.updateUser(
        UserModel(id: id, name: name, age: age, phoneNumber: phoneNumber));
    await fetchUsers();
  }

  Future<void> deleteUser(int id) async {
    await _dbService.deleteUser(id);
    await fetchUsers();
  }
}
