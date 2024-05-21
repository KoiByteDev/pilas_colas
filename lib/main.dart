import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/pages/main_page.dart';
import 'package:pilas_colas/providers/charlist_provider.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:provider/provider.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CharListProvider()),
        ChangeNotifierProvider(
            create: (context) => CimaCounter()), // Add CimaCounter provider
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MainPage());
  }
}
