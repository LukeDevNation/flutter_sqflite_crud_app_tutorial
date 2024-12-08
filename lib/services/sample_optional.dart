import 'dart:math';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';

Future<void> insertSampleData(Database db) async {
  List<UserModel> sampleUsers = List.generate(10, (index) {
    final random = Random();
    final names = [
      'John',
      'Jane',
      'James',
      'Mary',
      'Michael',
      'Emily',
      'David',
      'Sarah',
      'William',
      'Elizabeth'
    ];
    final phoneNumbers = [
      '+1 555-010${random.nextInt(10)}',
      '+1 555-011${random.nextInt(10)}',
      '+1 555-012${random.nextInt(10)}'
    ];

    return UserModel(
      name: names[index],
      age: random.nextInt(50) + 18, // Edad aleatoria entre 18 y 67
      phoneNumber: phoneNumbers[random.nextInt(phoneNumbers.length)],
    );
  });

  for (var user in sampleUsers) {
    await db.insert('Localdata', user.toMap());
  }
}
