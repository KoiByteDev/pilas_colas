import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/pages/main_page.dart';
import 'package:pilas_colas/providers/charlist_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharListProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 240, 255),
        body: Center(child: MainPage()),
      ),
    );
  }
}
