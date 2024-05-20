import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/components/display_pila.dart';
import 'package:pilas_colas/pages/new_item.dart';
import 'package:pilas_colas/providers/charlist_provider.dart';
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
      builder: (ctx) => NewItem(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 240, 255),
      appBar: AppBar(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Menu de Pilas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 224, 154, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
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
                          color:
                              Color.fromARGB(255, 104, 52, 97).withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(2, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: TextButton.icon(
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all<double>(18),
                        iconColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 224, 154, 238),
                        ),
                      ),
                      onPressed: _openAddItemOverlay,
                      label: const Text(
                        'Insertar Item',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.add_circle),
                    ),
                  ).animate().fadeIn(delay: 400.ms, duration: 700.ms).slideX(
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
                          color:
                              Color.fromARGB(255, 104, 52, 97).withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(2, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: TextButton.icon(
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all<double>(18),
                        iconColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 224, 154, 238),
                        ),
                      ),
                      onPressed: () {
                        if (context.read<CharListProvider>().charList.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Center(child: Text('La pila esta vacia!')),
                            ),
                          );
                        } else {
                          context.read<CharListProvider>().removeItem();
                        }
                      },
                      label: const Text(
                        'Eliminar Item',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.backspace_rounded),
                    ),
                  ).animate().fadeIn(delay: 600.ms, duration: 700.ms).slideX(
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
                          color:
                              Color.fromARGB(255, 104, 52, 97).withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(2, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: TextButton.icon(
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all<double>(12),
                        iconColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 224, 154, 238),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: const Text(
                        'Regresar',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ).animate().fadeIn(delay: 900.ms, duration: 700.ms).slideX(
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
            ],
          ),
        ),
      ),
    );
  }
}
