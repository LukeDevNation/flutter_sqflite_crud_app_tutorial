class UserModel {
  final int? id;
  final String name;
  final int age;
  final String phoneNumber;

  UserModel({
    this.id,
    required this.name,
    required this.age,
    required this.phoneNumber,
  });

  // Convertir a Map para base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': name,
      'Age': age,
      'PhoneNumber': phoneNumber,
    };
  }

  // Crear un modelo desde un Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['Name'],
      age: map['Age'],
      phoneNumber: map['PhoneNumber'],
    );
  }
}
