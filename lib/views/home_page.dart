import 'package:crud_sqflite/widgets/add_user.dart';
import 'package:crud_sqflite/widgets/delete_user.dart';
import 'package:crud_sqflite/widgets/input_age.dart';
import 'package:crud_sqflite/widgets/input_name.dart';
import 'package:crud_sqflite/widgets/input_phone.dart';
import 'package:crud_sqflite/widgets/text_presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  HomePage({super.key});

  // Función para mostrar el diálogo de edición
  Future<void> _showEditDialog(Map<String, dynamic> item, BuildContext context,
      HomeViewModel viewModel) async {
    _nameController.text = item['Name'];
    _ageController.text = item['Age'].toString();
    _phoneController.text = item['PhoneNumber'];

    await showDialog(
      context: context,
      // Esto previene que el diálogo se cierre al hacer clic fuera de él
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar datos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _phoneController,
                decoration:
                    const InputDecoration(labelText: 'Número de Teléfono'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                _nameController.clear(); // Limpiar los campos de texto
                _ageController.clear();
                _phoneController.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Guardar'),
              onPressed: () {
                // Muestra un cuadro de diálogo de confirmación antes de guardar
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmar cambios'),
                      content: const Text(
                          '¿Estás seguro de que quieres modificar los datos?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Cierra el diálogo
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Aceptar'),
                          onPressed: () {
                            // Guarda los cambios
                            viewModel.updateUser(
                                item['id'],
                                _nameController.text,
                                int.tryParse(_ageController.text) ?? 0,
                                _phoneController.text);
                            Navigator.of(context)
                                .pop(); // Cierra el cuadro de confirmación
                            Navigator.of(context)
                                .pop(); // Cierra el cuadro de edición
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

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
          Padding(
            padding: const EdgeInsets.all(16.0),
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
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(16.0),
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
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.teal),
                              onPressed: () {
                                _showEditDialog(
                                    user.toMap(), context, viewModel);
                              },
                            ),
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
        ],
      ),
    );
  }
}
