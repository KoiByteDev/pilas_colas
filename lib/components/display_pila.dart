import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/components/pila_box.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:pilas_colas/providers/pila_provider.dart';
import 'package:provider/provider.dart';

class DisplayPila extends StatefulWidget {
  const DisplayPila({super.key});

  @override
  State<DisplayPila> createState() => _DisplayPilaState();
}

class _DisplayPilaState extends State<DisplayPila> {
  @override
  Widget build(BuildContext context) {
    var item = Provider.of<PilaProvider>(context);
    final colorScheme = Theme.of(context).colorScheme;
    String cimaCounter = context.watch<CimaCounter>().cima.toString();
    List<String> displayItems = List<String>.filled(6, '');
    for (int i = 0; i < item.charList.length && i < 6; i++) {
      displayItems[i] = item.charList[i];
      print(displayItems);
    }

    return Row(
      children: [
        Consumer<PilaProvider>(
          builder: (context, charListProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return PilaBox(
                    item: displayItems.reversed.toList()[index], index: index);
              }),
            );
          },
        ),
        const SizedBox(
          width: 64,
        ),
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "CIMA = $cimaCounter",
                style: TextStyle(
                  color: cimaCounter == '6'
                      ? colorScheme.primary
                      : colorScheme.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
              Text(
                "CIMA = $cimaCounter",
                style: TextStyle(
                  color: cimaCounter == '5'
                      ? colorScheme.primary
                      : colorScheme.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
              Text(
                "CIMA = $cimaCounter",
                style: TextStyle(
                  color: cimaCounter == '4'
                      ? colorScheme.primary
                      : colorScheme.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
              Text(
                "CIMA = $cimaCounter",
                style: TextStyle(
                  color: cimaCounter == '3'
                      ? colorScheme.primary
                      : colorScheme.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
              Text(
                "CIMA = $cimaCounter",
                style: TextStyle(
                  color: cimaCounter == '2'
                      ? colorScheme.primary
                      : colorScheme.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
              Text(
                "CIMA = $cimaCounter",
                style: TextStyle(
                  color: cimaCounter == '0' || cimaCounter == '1'
                      ? colorScheme.primary
                      : colorScheme.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
            ],
          ),
        )
      ],
    );
  }
}
