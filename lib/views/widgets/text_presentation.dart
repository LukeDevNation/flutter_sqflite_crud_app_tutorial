import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      // The text that will be displayed
      'Add User',
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
