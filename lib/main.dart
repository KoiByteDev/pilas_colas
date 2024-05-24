import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/pages/main_page.dart';
import 'package:pilas_colas/providers/cola_provider.dart';
import 'package:pilas_colas/providers/mode_provider.dart';
import 'package:pilas_colas/providers/pila_provider.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:pilas_colas/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Animate.restartOnHotReload = true;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PilaProvider()),
        ChangeNotifierProvider(create: (context) => ColaProvider()),
        ChangeNotifierProvider(create: (context) => CimaCounter()),
        ChangeNotifierProvider(create: (context) => ModeProvider()),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()) // Add CimaCounter provider
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 255, 120, 226),
            brightness:
                themeProvider.lightTheme ? Brightness.light : Brightness.dark,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MainPage());
  }
}
