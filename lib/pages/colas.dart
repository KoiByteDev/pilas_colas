import 'package:flutter/material.dart';

class Colas extends StatelessWidget {
  const Colas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text('Area en desarrollo...'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: const Text('Back'),
            ),
            const SizedBox(
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
