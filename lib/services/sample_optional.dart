import 'dart:math';
import 'package:sqflite/sqflite.dart';
import '../models/user_model.dart';

// Function to insert sample data into the database
Future<void> insertSampleData(Database db) async {
  // Generate a list of 10 random users
  List<UserModel> sampleUsers = List.generate(10, (index) {
    // Create an instance of the Random class to generate random values
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
    ]; // A predefined list of names to randomly assign to users

    final phoneNumbers = [
      '+1 555-010${random.nextInt(10)}',
      '+1 555-011${random.nextInt(10)}',
      '+1 555-012${random.nextInt(10)}'
    ]; // A list of predefined phone number formats, each with a random digit at the end

    // Create a UserModel instance with random data for each user
    return UserModel(
      // Assign a name from the list using the index
      name: names[index],
      // Generate a random age between 18 and 67
      age: random.nextInt(50) + 18,
      // Randomly select a phone number
      phoneNumber: phoneNumbers[random.nextInt(phoneNumbers.length)],
    );
  });

  // Insert each generated user into the 'Localdata' table in the database
  for (var user in sampleUsers) {
    await db.insert('Localdata',
        user.toMap()); // Insert each user as a map into the database
  }
}
