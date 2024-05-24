import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/components/display_cola.dart';
import 'package:pilas_colas/components/display_pila.dart';
import 'package:pilas_colas/pages/main_page.dart';
import 'package:pilas_colas/pages/new_item.dart';
import 'package:pilas_colas/providers/cola_provider.dart';
import 'package:pilas_colas/providers/mode_provider.dart';
import 'package:pilas_colas/providers/pila_provider.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:pilas_colas/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var _isShaking = false;

  void _openAddItemOverlay(mode) {
    print(mode.toString());
    if (mode == 'pila') {
      if (context.read<PilaProvider>().charList.length < 6) {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => const NewItem(),
        );
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
                child: Text(
              'La pila esta llena!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        );
      }
    } else if (mode == 'cola') {
      if (context.read<ColaProvider>().getFront() == '') {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => const NewItem(),
        );
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
                child: Text(
              'La cola esta llena!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        );
      }
    }
  }

  void _handleEliminar(mode) {
    if (mode == 'pila') {
      if (context.read<PilaProvider>().charList.isEmpty) {
        _shake();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
                child: Text(
              'La pila esta vacia!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        );
      } else {
        context.read<PilaProvider>().removeItem();
        context.read<CimaCounter>().substract();
      }
    } else if (mode == 'cola') {
      if (context.read<ColaProvider>().getRear() == '') {
        _shake();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
                child: Text(
              'La cola esta vacia!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        );
      } else {
        context.read<ColaProvider>().removeItem();
        context.read<CimaCounter>().substract();
      }
    }
  }

  void _shake() {
    setState(() {
      _isShaking = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mode = Provider.of<ModeProvider>(context);
    String cimaCounter = context.watch<CimaCounter>().cima.toString();
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.secondary.withOpacity(0.4),
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
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mode.mode == 'pila' ? "Menu de Pilas" : "Menu de Colas",
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    IconButton(
                      style: ButtonStyle(
                        iconColor: MaterialStateProperty.all<Color>(
                            colorScheme.onPrimary),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          colorScheme.onSecondaryContainer
                        ),
                      ),
                      icon: const Icon(Icons.sunny),
                      onPressed: () {
                        themeProvider.toggleTheme();
                      },
                    ),
                  ],
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
                                color: colorScheme.secondary.withOpacity(0.2),
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
                                  colorScheme.onPrimary),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                colorScheme.primary,
                              ),
                            ),
                            onPressed: () {
                              _openAddItemOverlay(mode.mode);
                            },
                            label: Text(
                              'Insertar Item',
                              style: TextStyle(color: colorScheme.onPrimary),
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
                                color: colorScheme.secondary.withOpacity(0.2),
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
                                  colorScheme.onPrimary),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                colorScheme.primary,
                              ),
                            ),
                            onPressed: () {
                              _handleEliminar(mode.mode);
                            },
                            label: Text(
                              'Eliminar Item',
                              style: TextStyle(color: colorScheme.onPrimary),
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
                                color: colorScheme.secondary.withOpacity(0.2),
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
                                  colorScheme.onPrimary),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                colorScheme.primary,
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
                            label: Text(
                              'Regresar',
                              style: TextStyle(color: colorScheme.onPrimary),
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
                    mode.mode == 'pila'
                        ? const DisplayPila()
                        : const DisplayCola()
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
