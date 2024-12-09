import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/home_viewmodel.dart';

class ButtonUpdateUserWidget extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ButtonUpdateUserWidget({super.key, required this.userData});

  Future<void> _showEditDialog(BuildContext context) async {
    final nameController = TextEditingController(text: userData['Name']);
    final ageController =
        TextEditingController(text: userData['Age'].toString());
    final phoneController =
        TextEditingController(text: userData['PhoneNumber']);
    final viewModel = context.read<HomeViewModel>();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar datos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Edad'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: phoneController,
                decoration:
                    const InputDecoration(labelText: 'Número de Teléfono'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Guardar'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmar cambios'),
                      content: const Text(
                          '¿Estás seguro de que quieres modificar los datos?'),
                      actions: [
                        ElevatedButton(
                          child: const Text('Aceptar'),
                          onPressed: () {
                            viewModel.updateUser(
                              userData['id'],
                              nameController.text,
                              int.tryParse(ageController.text) ?? 0,
                              phoneController.text,
                            );
                            Navigator.of(context).pop(); // Cierra confirmación
                            Navigator.of(context).pop(); // Cierra edición
                          },
                        ),
                        TextButton(
                          child: const Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
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
    return IconButton(
      icon: const Icon(Icons.edit, color: Colors.teal),
      onPressed: () => _showEditDialog(context),
    );
  }
}
