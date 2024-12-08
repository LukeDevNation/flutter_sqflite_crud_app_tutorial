import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crud_sqflite/models/data_model.dart';
import 'package:crud_sqflite/models/local_database.dart';

class HomeViewModel extends ChangeNotifier {
  final LocalDatabase _localDatabase = LocalDatabase();
  List<DataModel> _dataList = [];
  List<DataModel> get dataList => _dataList;

  Future<void> fetchData() async {
    _dataList = await _localDatabase.readAllData();
    if (_dataList.isEmpty) {
      await addRandomData();
    }
    notifyListeners();
  }

  Future<void> addData(DataModel data) async {
    await _localDatabase.addDataLocally(data);
    fetchData();
  }

  Future<void> updateData(DataModel data) async {
    await _localDatabase.updateData(data);
    fetchData();
  }

  Future<void> deleteData(int id) async {
    await _localDatabase.deleteData(id);
    fetchData();
  }

  Future<void> addRandomData() async {
    List<DataModel> randomData = [];
    Random random = Random();
    List<String> names = ["Juan Pérez", "Ana López", "Carlos Gómez", "María Rodríguez", "Pedro Sánchez"];
    List<String> phoneNumbers = ["091234567", "098765432", "091112233", "099998877", "097654321"];

    for (int i = 0; i < 10; i++) {
      String name = names[random.nextInt(names.length)];
      int age = random.nextInt(50) + 18;
      String phoneNumber = phoneNumbers[random.nextInt(phoneNumbers.length)];
      randomData.add(DataModel(name: name, age: age, phoneNumber: phoneNumber));
    }

    for (var data in randomData) {
      await addData(data);
    }
  }
}
