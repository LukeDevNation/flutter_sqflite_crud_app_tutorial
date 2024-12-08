import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputAgeWidget extends StatelessWidget {
  final TextEditingController ageController;
  const InputAgeWidget({super.key, required this.ageController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ageController,
      decoration: InputDecoration(
        labelText: 'Edad',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      // Muestra un teclado numérico
      keyboardType: TextInputType.number,
      // Solo números
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
