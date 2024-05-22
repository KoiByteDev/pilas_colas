import 'package:flutter/material.dart';
import 'package:pilas_colas/components/box.dart';

class DisplayPila extends StatefulWidget {
  const DisplayPila({super.key, required this.item});

  final List<String> item;

  @override
  State<DisplayPila> createState() => _DisplayPilaState();
}

class _DisplayPilaState extends State<DisplayPila> {
  @override
  Widget build(BuildContext context) {
    List<String> displayItems = List<String>.filled(6, '');
    for (int i = 0; i < widget.item.length && i < 6; i++) {
      displayItems[i] = widget.item[i];
      print(displayItems);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Box(item: displayItems.reversed.toList()[index], index: index);
      }),
    );
  }
}
