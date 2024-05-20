import 'package:flutter/material.dart';

class Colas extends StatelessWidget {
  const Colas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("Menu de Colas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Area en desarrollo...'),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
