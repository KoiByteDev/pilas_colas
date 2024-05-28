import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pilas_colas/components/cola_box.dart';
import 'package:pilas_colas/providers/cima_counter.dart';
import 'package:pilas_colas/providers/cola_provider.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    context.watch<CimaCounter>().cima.toString();
    List<String> displayItems = List<String>.filled(6, '');
    for (int i = 0; i < item.charList.length && i < 6; i++) {
      displayItems[i] = item.charList[i];
    }

    double toRadians(degree) {
      return degree * (3.1415926535 / 180);
    }

    int _displayRear() {
      if (item.charList[item.rear] == '' && item.charList[item.front] == '') {
        return 0;
      } else {
        return item.rear + 1;
      }
    }

    int _displayFront() {
      if (item.charList[item.rear] == '' && item.charList[item.front] == '') {
        return 0;
      } else {
        return item.front + 1;
      }
    }

    return Column(
      children: [
        const SizedBox(
          height: 36,
        ),
        Row(
          children: [
            SizedBox(
              child: Text(
                "FINAL = ${_displayRear()}",
                style: TextStyle(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 1000.ms).slideX(
                  begin: -2,
                  delay: 1000.ms,
                  duration: 1000.ms,
                  curve: Easing.legacyDecelerate),
            ),
            const SizedBox(
              width: 32,
            ),
            SizedBox(
              child: Text(
                "FRENTE = ${_displayFront()}",
                style: TextStyle(
                  color: colorScheme.primary,
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
          height: 12,
        ),
        AnimatedRotation(
          turns: item.front == 0 && item.rear == 0
              ? 0
              : toRadians(-9.55 * (item.counter - 1)),
          duration: 350.ms,
          curve: Curves.easeInOutCirc,
          child: SizedBox(
            width: 380,
            height: 380,
            child: Stack(
              children: [
                Align(
                  alignment: const Alignment(0, -0.97),
                  child: ColaBox(
                    item: displayItems[0],
                    index: 0,
                  ),
                ),
                Align(
                  alignment: const Alignment(1, -0.5),
                  child: Transform.rotate(
                    angle: 1.0471975512,
                    child: ColaBox(
                      item: displayItems[1],
                      index: 1,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1, 0.45),
                  child: Transform.rotate(
                    angle: 2.09439510239,
                    child: ColaBox(
                      item: displayItems[2],
                      index: 2,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.928),
                  child: Transform.rotate(
                    angle: 3.14159265359,
                    child: ColaBox(
                      item: displayItems[3],
                      index: 3,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-1, 0.45),
                  child: Transform.rotate(
                    angle: 4.18879020479,
                    child: ColaBox(
                      item: displayItems[4],
                      index: 4,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(-1, -0.5),
                  child: Transform.rotate(
                    angle: 5.23598775598,
                    child: ColaBox(
                      item: displayItems[5],
                      index: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
