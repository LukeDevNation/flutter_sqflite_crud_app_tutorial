import 'package:crud_sqflite/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';
import 'package:crud_sqflite/viewmodels/home_viewmodel.dart';

void main() {
  // Initialize sqfliteFfi for non-web platforms (Windows, Linux, or macOS)
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      // Disable the debug banner in the app
      debugShowCheckedModeBanner: false, 
      title: 'CRUD Example',
      home: HomePage(),
    );
  }
}
