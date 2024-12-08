import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPhoneWidget extends StatelessWidget {
  final TextEditingController phoneController;

  const InputPhoneWidget({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: 'Teléfono',
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
