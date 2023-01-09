import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';
import 'package:mathgame/util/number_key.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    'X',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: numberPad.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            return NumberKey(
              child: numberPad[index],
            );
          },
        ));
  }
}
