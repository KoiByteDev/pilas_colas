import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/providers/cola_provider.dart';
import 'package:pilas_colas/providers/mode_provider.dart';
import 'package:pilas_colas/providers/pila_provider.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:provider/provider.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _itemController = TextEditingController();

  @override
  void dispose() {
    _itemController.dispose();
    super.dispose();
  }

  void _submitItem(mode) {
    final newItem = _itemController.text;
    try {
      int item = int.parse(newItem);
      if (newItem.isEmpty) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Center(
          child: Text(
            "Por favor introduzca un valor.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )));
      } else if (item < 1 || item > 99) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Center(
          child: Text(
            "Por favor introduzca un valor entre 1 y 99.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )));
      } else {
        if (mode == 'pila') {
          context.read<PilaProvider>().addItem(newItem);
          _itemController.clear();
          Navigator.of(context).pop();
        } else if (mode == 'cola') {
          context.read<ColaProvider>().addItem(newItem);
          _itemController.clear();
          Navigator.of(context).pop();
        }
        context.read<CimaCounter>().add();
      }
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Center(
          child: Text(
            "Por favor introduzca un número válido.",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mode = Provider.of<ModeProvider>(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _itemController,
            maxLength: 24,
            decoration: const InputDecoration(
              label: Text("Introduzca un numero del 1 al 99"),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 104, 52, 97).withOpacity(0.2),
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
                iconColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 224, 154, 238),
                ),
              ),
              onPressed: () {
                _submitItem(mode.mode);
              },
              label: const Text(
                'Añadir',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(Icons.add),
            ),
          ).animate().fadeIn(delay: 900.ms, duration: 700.ms).slideY(
                delay: 900.ms,
                duration: 700.ms,
                curve: Easing.legacyDecelerate,
                begin: 2,
              ),
        ],
      ),
    );
  }
}
