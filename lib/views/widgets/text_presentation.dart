import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  const TextCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      ' Create New User:',
      style: TextStyle(
        fontSize: 18,
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(214, 255, 255, 255),
      ),
    );
  }
}
