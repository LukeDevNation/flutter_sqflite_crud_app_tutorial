import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/database_service.dart';

class HomeViewModel extends ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  // update list database
  Future<void> fetchUsers() async {
    _users = await _dbService.getAllUsers();
    notifyListeners();
  }

  // add user database
  Future<void> addUser(String name, int age, String phoneNumber) async {
    await _dbService.addUser(
      UserModel(name: name, age: age, phoneNumber: phoneNumber),
    );
    await fetchUsers(); // Actualizar la lista después de agregar
  }

  Future<void> updateUser(
      int id, String name, int age, String phoneNumber) async {
    if (id <= 0 || name.isEmpty || phoneNumber.isEmpty || age <= 0) {
      // ignore: avoid_print
      print('Datos inválidos para actualizar usuario.');
      return;
    }
    await _dbService.updateUser(
      UserModel(id: id, name: name, age: age, phoneNumber: phoneNumber),
    );
    await fetchUsers();
  }

  // delete user database
  Future<void> deleteUser(int id) async {
    await _dbService.deleteUser(id);
    await fetchUsers();
  }
}
