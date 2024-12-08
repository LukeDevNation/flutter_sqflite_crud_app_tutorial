import 'package:crud_sqflite/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonDeleteUserWidget extends StatelessWidget {
  final int userId;

  const ButtonDeleteUserWidget({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    Future<void> confirmDelete(int id) async {
      final result = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmar eliminación'),
            content:
                const Text('¿Estás seguro de que quieres eliminar este dato?'),
            actions: [
              ElevatedButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        },
      );

      if (result == true) {
        await viewModel.deleteUser(id);
      }
    }

    return IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
      onPressed: () => confirmDelete(userId),
    );
  }
}
