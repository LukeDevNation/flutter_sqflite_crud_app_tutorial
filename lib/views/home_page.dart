import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crud_sqflite/viewmodels/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(title: const Text('CRUD Example')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //controller: _ageController,
              decoration: const InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              //controller: _phoneController,
              decoration:
                  const InputDecoration(labelText: 'Número de Teléfono'),
            ),
          ),
          // Formularios de entrada
          // (campos para agregar datos como antes)
          ElevatedButton(
            onPressed: () {
              // Lógica para agregar datos
            },
            child: const Text('Agregar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: homeViewModel.dataList.length,
              itemBuilder: (context, index) {
                final item = homeViewModel.dataList[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Edad: ${item.age}, Teléfono: ${item.phoneNumber}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Lógica para editar
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          homeViewModel.deleteData(item.id!);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
