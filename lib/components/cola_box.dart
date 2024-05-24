import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/utils/cola_clipper.dart';

class ColaBox extends StatelessWidget {
  const ColaBox({super.key, required this.item, required this.index});

  final String item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ColaClipper(),
      child: Container(
        width: 150,
        height: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 224, 154, 238),
        ),
        child: Center(
          child: Transform.rotate(
            angle: index * 5.234,
            child: Text(
              item,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ).animate().fadeIn(delay: (index * 150).ms, duration: 800.ms).slideX(
          delay: (index * 170).ms,
          duration: 800.ms,
          begin: 2,
          curve: Easing.legacyDecelerate),
    );
  }
}
