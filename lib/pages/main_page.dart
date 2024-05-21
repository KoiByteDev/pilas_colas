import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/pages/colas.dart';
import 'package:pilas_colas/pages/pilas.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bool _isIntro = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 104, 52, 97).withOpacity(0.4),
                  spreadRadius: 7,
                  blurRadius: 15,
                  offset: const Offset(13, 3),
                ),
              ],
              color: const Color.fromARGB(255, 224, 154, 238),
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
                const Text(
                  'UTP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 46,
                      fontWeight: FontWeight.bold),
                ).animate().fadeIn(duration: 600.ms).slideY(
                    duration: 1000.ms,
                    curve: Easing.legacyDecelerate,
                    begin: _isIntro ? -3 : 3,
                    end: _isIntro ? 0 : -3),
                const Text(
                  'Estructura y Representacion de Datos',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
                            color: const Color.fromARGB(255, 104, 52, 97)
                                .withOpacity(0.2),
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
                          iconColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 224, 154, 238),
                          ),
                        ),
                        icon: const Icon(Icons.stacked_bar_chart_rounded),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Pilas(),
                              transitionDuration: Duration(milliseconds: 155),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ),
                          );
                        },
                        label: const Text(
                          'Pilas',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                  .animate()
                  .fadeIn(delay: 1000.ms, duration: 500.ms)
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
                            color: const Color.fromARGB(255, 104, 52, 97)
                                .withOpacity(0.2),
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
                          iconColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 224, 154, 238),
                          ),
                        ),
                        icon: const Icon(Icons.queue),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Colas()));
                        },
                        label: const Text(
                          'Colas',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                  .animate()
                  .fadeIn(delay: 1000.ms, duration: 500.ms)
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
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Container(
          //         width: 100, // Set the desired width of the divider
          //         height: 2, // Set the desired thickness of the divider
          //         color: Color.fromARGB(
          //             255, 224, 154, 238), // Set the color of the divider
          //       ),
          //       SizedBox(
          //         width: 24,
          //       ), // Add some space between the dividers
          //       Container(
          //         width: 100, // Set the desired width of the divider
          //         height: 2, // Set the desired thickness of the divider
          //         color: Color.fromARGB(
          //             255, 224, 154, 238), // Set the color of the divider
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              const Text('Desarrollado por:')
                  .animate()
                  .fadeIn(delay: 1500.ms)
                  .slideX(
                      delay: 1500.ms,
                      begin: -2,
                      curve: Easing.legacyDecelerate),
              const SizedBox(height: 12),
              const Text('Erm what the sigma')
                  .animate()
                  .fadeIn(delay: 1600.ms)
                  .slideX(
                      delay: 1600.ms,
                      begin: -2,
                      curve: Easing.legacyDecelerate),
              const Text('Samuel Arosemena')
                  .animate()
                  .fadeIn(delay: 1700.ms)
                  .slideX(
                      delay: 1700.ms,
                      begin: -2,
                      curve: Easing.legacyDecelerate),
              const Text('El de arriba se va emoteadisimo')
                  .animate()
                  .fadeIn(delay: 1800.ms)
                  .slideX(
                      delay: 1800.ms,
                      begin: -2,
                      curve: Easing.legacyDecelerate),
              const Text('poya').animate().fadeIn(delay: 1900.ms).slideX(
                  delay: 1900.ms, begin: -2, curve: Easing.legacyDecelerate),
            ],
          )
        ],
      ),
    );
  }
}
