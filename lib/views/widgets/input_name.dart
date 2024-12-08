import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNameWidget extends StatelessWidget {
  final TextEditingController nameController;

  const InputNameWidget({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'Nombre',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      // Solo letras y espacios
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
      ],
      // Sugerencia del teclado para nombres
      keyboardType: TextInputType.name,
    );
  }
}
