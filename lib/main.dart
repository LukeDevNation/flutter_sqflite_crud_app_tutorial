import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:crud_sqflite/viewmodels/home_viewmodel.dart';
import 'package:crud_sqflite/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize sqfliteFfi for non-web platforms (Windows, Linux, or macOS)
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    // Establecer el tamaño inicial de la ventana
    await windowManager.setSize(const Size(350, 700));

    // tamaño maximo y minimo de la ventana en windows
    WindowManager.instance.setMinimumSize(const Size(500, 500));
    //WindowManager.instance.setMaximumSize(const Size(1200, 600));

    // Centrar la ventana en la pantalla
    await WindowManager.instance.setAlignment(Alignment.center);

    // Establecer el título de la ventana
    await windowManager.setTitle("CRUD sqflite Example by LukeDevNation");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel()..fetchUsers(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disable the debug banner in the app
      debugShowCheckedModeBanner: false,
      title: 'CRUD Example',
      home: HomePage(),
    );
  }
}
