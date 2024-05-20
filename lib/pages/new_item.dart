import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/providers/charlist_provider.dart';
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

  void _submitItem() {
    final newItem = _itemController.text;
    if (newItem.isNotEmpty) {
      context.read<CharListProvider>().addItem(newItem);
      _itemController.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _itemController,
            maxLength: 24,
            decoration: const InputDecoration(
              label: Text("Introduzca el item"),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 104, 52, 97).withOpacity(0.2),
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
                iconColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 224, 154, 238),
                ),
              ),
              onPressed: () {
                if (context.read<CharListProvider>().charList.length < 5) {
                  _submitItem();
                } else {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(child: Text('La pila esta llena!')),
                    ),
                  );
                }
              },
              label: const Text(
                'Añadir',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(Icons.add),
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
