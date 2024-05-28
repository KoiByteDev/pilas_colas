import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/providers/cola_provider.dart';
import 'package:pilas_colas/utils/cola_clipper.dart';
import 'package:provider/provider.dart';

class ColaBox extends StatelessWidget {
  const ColaBox({super.key, required this.item, required this.index});

  final String item;
  final int index;

  @override
  Widget build(BuildContext context) {
    double toRadians(degree) {
      return degree * (3.1415926535/180);
    }
    var rotation = Provider.of<ColaProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    return ClipPath(
            clipper: ColaClipper(),
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: colorScheme.primary,
              ),
              child: Center(
                child: AnimatedRotation(
                  turns: rotation.front == 0 && rotation.rear == 0 ? 0 : toRadians(9.5 * (rotation.counter - 1)),
                  duration: 350.ms,
                  curve: Curves.easeInOutCirc,
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
              ),
            ))
        .animate()
        .fadeIn(delay: (index * 150).ms, duration: 850.ms)
        .slideY(
            delay: (index * 150).ms,
            duration: 850.ms,
            begin: -2,
            curve: Easing.legacyDecelerate);
  }
}
