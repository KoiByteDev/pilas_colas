import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/components/display_pila.dart';
import 'package:pilas_colas/pages/main_page.dart';
import 'package:pilas_colas/pages/new_item.dart';
import 'package:pilas_colas/providers/charlist_provider.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:provider/provider.dart';

class Pilas extends StatefulWidget {
  const Pilas({super.key});

  @override
  State<Pilas> createState() => _PilasState();
}

class _PilasState extends State<Pilas> {
  void _openAddItemOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewItem(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String cimaCounter = context.watch<CimaCounter>().cima.toString();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 240, 255),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
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
              child: const Center(
                child: Text(
                  "Menu de Pilas",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
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
                              iconSize: MaterialStateProperty.all<double>(18),
                              iconColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 224, 154, 238),
                              ),
                            ),
                            onPressed: _openAddItemOverlay,
                            label: const Text(
                              'Insertar Item',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: const Icon(Icons.add_circle),
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 400.ms, duration: 700.ms)
                            .slideX(
                              delay: 400.ms,
                              duration: 700.ms,
                              curve: Easing.legacyDecelerate,
                              begin: -1,
                            ),
                        const SizedBox(
                          height: 24,
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
                              iconSize: MaterialStateProperty.all<double>(18),
                              iconColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 224, 154, 238),
                              ),
                            ),
                            onPressed: () {
                              if (context
                                  .read<CharListProvider>()
                                  .charList
                                  .isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Center(
                                        child: Text('La pila esta vacia!')),
                                  ),
                                );
                              } else {
                                context.read<CharListProvider>().removeItem();
                                context.read<CimaCounter>().substract();
                              }
                            },
                            label: const Text(
                              'Eliminar Item',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: const Icon(Icons.backspace_rounded),
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 600.ms, duration: 700.ms)
                            .slideX(
                              delay: 600.ms,
                              duration: 700.ms,
                              curve: Easing.legacyDecelerate,
                              begin: -1,
                            ),
                        const SizedBox(
                          height: 24,
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
                              iconSize: MaterialStateProperty.all<double>(12),
                              iconColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 224, 154, 238),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => MainPage(),
                                  transitionDuration:
                                      Duration(milliseconds: 155),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ),
                              );
                            },
                            label: const Text(
                              'Regresar',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: const Icon(Icons.arrow_back_ios_rounded),
                          ),
                        )
                            .animate()
                            .fadeIn(delay: 900.ms, duration: 700.ms)
                            .slideX(
                              delay: 900.ms,
                              duration: 700.ms,
                              curve: Easing.legacyDecelerate,
                              begin: -1,
                            ),
                      ],
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Consumer<CharListProvider>(
                      builder: (context, charListProvider, child) {
                        return DisplayPila(
                          item: charListProvider.charList,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 64),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "CIMA = $cimaCounter",
                              style: TextStyle(
                                color: cimaCounter == '5'
                                    ? Color.fromARGB(255, 224, 154, 238)
                                    : Color.fromARGB(255, 255, 240, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 1000.ms, duration: 1000.ms)
                                .slideX(
                                    begin: 2,
                                    delay: 1000.ms,
                                    duration: 1000.ms,
                                    curve: Easing.legacyDecelerate),
                            Text(
                              "CIMA = $cimaCounter",
                              style: TextStyle(
                                color: cimaCounter == '4'
                                    ? Color.fromARGB(255, 224, 154, 238)
                                    : Color.fromARGB(255, 255, 240, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 1000.ms, duration: 1000.ms)
                                .slideX(
                                    begin: 2,
                                    delay: 1000.ms,
                                    duration: 1000.ms,
                                    curve: Easing.legacyDecelerate),
                            Text(
                              "CIMA = $cimaCounter",
                              style: TextStyle(
                                color: cimaCounter == '3'
                                    ? Color.fromARGB(255, 224, 154, 238)
                                    : Color.fromARGB(255, 255, 240, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 1000.ms, duration: 1000.ms)
                                .slideX(
                                    begin: 2,
                                    delay: 1000.ms,
                                    duration: 1000.ms,
                                    curve: Easing.legacyDecelerate),
                            Text(
                              "CIMA = $cimaCounter",
                              style: TextStyle(
                                color: cimaCounter == '2'
                                    ? Color.fromARGB(255, 224, 154, 238)
                                    : Color.fromARGB(255, 255, 240, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 1000.ms, duration: 1000.ms)
                                .slideX(
                                    begin: 2,
                                    delay: 1000.ms,
                                    duration: 1000.ms,
                                    curve: Easing.legacyDecelerate),
                            Text(
                              "CIMA = $cimaCounter",
                              style: TextStyle(
                                color: cimaCounter == '0' || cimaCounter == '1'
                                    ? Color.fromARGB(255, 224, 154, 238)
                                    : Color.fromARGB(255, 255, 240, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            )
                                .animate()
                                .fadeIn(delay: 1000.ms, duration: 1000.ms)
                                .slideX(
                                    begin: 2,
                                    delay: 1000.ms,
                                    duration: 1000.ms,
                                    curve: Easing.legacyDecelerate),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
