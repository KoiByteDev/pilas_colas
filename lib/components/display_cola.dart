import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/components/cola_box.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:pilas_colas/providers/cola_provider.dart';
import 'package:pilas_colas/providers/pila_provider.dart';
import 'package:provider/provider.dart';

class DisplayCola extends StatefulWidget {
  const DisplayCola({super.key});

  @override
  State<DisplayCola> createState() => _DisplayColaState();
}

class _DisplayColaState extends State<DisplayCola> {
  @override
  Widget build(BuildContext context) {
    var item = Provider.of<ColaProvider>(context);
    String cimaCounter = context.watch<CimaCounter>().cima.toString();
    List<String> displayItems = List<String>.filled(6, '');
    for (int i = 0; i < item.charList.length && i < 6; i++) {
      displayItems[i] = item.charList[i];
      print(displayItems);
    }

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              child: Text(
                "FINAL = ${item.rear}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 154, 238),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
            ),
            const SizedBox(
              width: 32,
            ),
            SizedBox(
              child: Text(
                "FRENTE = ${item.front}",
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 154, 238),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: 2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: 380,
          height: 380,
          child: Consumer<ColaProvider>(
            builder: (context, charListProvider, child) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment(0, -0.985),
                    child: ColaBox(
                      item: displayItems[0],
                      index: 0,
                    ),
                  ),
                  Align(
                    alignment: Alignment(1, -0.5),
                    child: Transform.rotate(
                      angle: 1.0471975512,
                      child: ColaBox(
                        item: displayItems[1],
                        index: 1,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(1, 0.45),
                    child: Transform.rotate(
                      angle: 2.09439510239,
                      child: ColaBox(
                        item: displayItems[2],
                        index: 2,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.935),
                    child: Transform.rotate(
                      angle: 3.14159265359,
                      child: ColaBox(
                        item: displayItems[3],
                        index: 3,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1, 0.45),
                    child: Transform.rotate(
                      angle: 4.18879020479,
                      child: ColaBox(
                        item: displayItems[4],
                        index: 4,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1, -0.5),
                    child: Transform.rotate(
                      angle: 5.23598775598,
                      child: ColaBox(
                        item: displayItems[5],
                        index: 5,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
