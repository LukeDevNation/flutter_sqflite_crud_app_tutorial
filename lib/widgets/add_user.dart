import 'package:crud_sqflite/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonAddUserWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController phoneController;

  const ButtonAddUserWidget(
      {super.key,
      required this.nameController,
      required this.ageController,
      required this.phoneController});

  Future<void> _showErrorDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final name = nameController.text.trim();
          final ageText = ageController.text.trim();
          final phone = phoneController.text.trim();

          // Verificar nombre válido (sin números ni caracteres especiales)
          final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
          if (!nameRegex.hasMatch(name)) {
            await _showErrorDialog(context, 'Ingresa el Nombre.');
            return;
          }

          // Verificar edad válida
          final age = int.tryParse(ageText);
          if (age == null || age <= 0) {
            await _showErrorDialog(context, 'Ingresa la Edad.');
            return;
          }

          // Verificar teléfono válido (solo números)
          final phoneRegex = RegExp(r'^\d+$');
          if (!phoneRegex.hasMatch(phone)) {
            await _showErrorDialog(context, 'Ingresa el Numero de Telefono.');
            return;
          }

          // Agregar usuario si los datos son válidos
          await viewModel.addUser(name, age, phone);

          // Limpiar los campos
          nameController.clear();
          ageController.clear();
          phoneController.clear();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Agregar Usuario'),
      ),
    );
  }
}
