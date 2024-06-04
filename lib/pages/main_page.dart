import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/pages/menu.dart';

import 'package:pilas_colas/providers/mode_provider.dart';
import 'package:pilas_colas/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bool _isIntro = true;

  @override
  Widget build(BuildContext context) {
    final mode = Provider.of<ModeProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.onSecondary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.3),
                  spreadRadius: 7,
                  blurRadius: 15,
                  offset: const Offset(13, 3),
                ),
              ],
              color: colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60),
                bottomRight: Radius.circular(60),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 48,
                ),
                Text(
                  'UTP',
                  style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 46,
                      fontWeight: FontWeight.bold),
                ).animate().fadeIn(duration: 600.ms).slideY(
                    duration: 1000.ms,
                    curve: Easing.legacyDecelerate,
                    begin: _isIntro ? -3 : 3,
                    end: _isIntro ? 0 : -3),
                Text(
                  'Estructura y Representacion de Datos',
                  style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold),
                ).animate().fadeIn(delay: 500.ms, duration: 650.ms).slideX(
                    delay: 500.ms,
                    duration: 1000.ms,
                    curve: Easing.legacyDecelerate,
                    begin: -2),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(2, 4),
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: TextButton.icon(
                        style: ButtonStyle(
                          iconColor: WidgetStateProperty.all<Color>(
                              colorScheme.onPrimary),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            colorScheme.primary,
                          ),
                        ),
                        icon: const Icon(Icons.stacked_bar_chart_rounded),
                        onPressed: () {
                          mode.setPila();
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const Menu(),
                              transitionDuration: const Duration(milliseconds: 155),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
                        },
                        label: Text(
                          'Pilas',
                          style: TextStyle(color: colorScheme.onPrimary),
                        ),
                      ))
                  .animate()
                  .fadeIn(delay: 1200.ms, duration: 500.ms)
                  .slideX(
                    delay: 1000.ms,
                    duration: 700.ms,
                    curve: Easing.legacyDecelerate,
                    begin: -2,
                  ),
              const SizedBox(
                width: 24,
              ),
              Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                colorScheme.shadow.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(2, 4)
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: TextButton.icon(
                        style: ButtonStyle(
                          iconColor: WidgetStateProperty.all<Color>(
                              colorScheme.onPrimary),
                          backgroundColor: WidgetStateProperty.all<Color>(
                            colorScheme.primary,
                          ),
                        ),
                        icon: const Icon(Icons.queue),
                        onPressed: () {
                          mode.setCola();
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const Menu(),
                              transitionDuration: const Duration(milliseconds: 155),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
                        },
                        label: Text(
                          'Colas',
                          style: TextStyle(color: colorScheme.onPrimary),
                        ),
                      ))
                  .animate()
                  .fadeIn(delay: 1200.ms, duration: 500.ms)
                  .slideX(
                    delay: 1000.ms,
                    duration: 700.ms,
                    curve: Easing.legacyDecelerate,
                    begin: 2,
                  ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: IconButton(
                  style: ButtonStyle(
                    iconColor:
                        WidgetStateProperty.all<Color>(colorScheme.onPrimary),
                    backgroundColor: WidgetStateProperty.all<Color>(
                      colorScheme.primary,
                    ),
                  ),
                  icon: const Icon(Icons.sunny),
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 500.ms).slideY(
                    delay: 1000.ms,
                    duration: 700.ms,
                    curve: Curves.bounceOut,
                    begin: -2,
                  ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Desarrollado por:',
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ).animate().fadeIn(delay: 1500.ms).slideX(
                  delay: 1500.ms, begin: -2, curve: Easing.legacyDecelerate),
              const SizedBox(height: 12),
              Text(
                'Alejandro Mendoza',
                style: TextStyle(color: colorScheme.onSecondaryContainer),
              ).animate().fadeIn(delay: 1600.ms).slideX(
                  delay: 1600.ms, begin: -2, curve: Easing.legacyDecelerate),
            ],
          )
        ],
      ),
    );
  }
}
