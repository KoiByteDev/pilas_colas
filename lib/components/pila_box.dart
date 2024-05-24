import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PilaBox extends StatelessWidget {
  const PilaBox({super.key, required this.item, required this.index});

  final String item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: const EdgeInsets.all(6),
        width: 160,
        height: 75,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: colorScheme.secondary.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(3, 3),
            )
          ],
          color: colorScheme.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        child: Center(
          child: Text(
            item,
            style: TextStyle(
                color: colorScheme.onPrimary, fontSize: 24, fontWeight: FontWeight.bold),
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
