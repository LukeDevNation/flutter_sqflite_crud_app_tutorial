class DataModel {
  final int? id;
  final String name;
  final int age;
  final String phoneNumber;

  DataModel({this.id, required this.name, required this.age, required this.phoneNumber});

  // Convertir de Map a DataModel
  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'],
      name: map['Name'],
      age: map['Age'],
      phoneNumber: map['PhoneNumber'],
    );
  }

  // Convertir de DataModel a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Name': name,
      'Age': age,
      'PhoneNumber': phoneNumber,
    };
  }
}
