// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:math';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';
import 'package:mathgame/util/number_key.dart';
import 'package:mathgame/util/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userAnswer = '';

  List<String> numberPad = [
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
  //number A, number B
  int num1 = 1;
  int num2 = 1;
  int points = 0;
  String displayResult = '';
  var reslutColor=Colors.deepPurple;

  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        //check if user is correct or not
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (num1 + num2 == int.parse(userAnswer)) {
      showDialog(
        context: context,
        builder: ((context) {
          return ResultMessage(
            icon: Icons.arrow_forward,
            message: 'Correct!',
            onTap: goToNextQuestion,
          );
        }),
      );
      points = points + 10;
      displayResult = '+10';
      reslutColor = Colors.green;
    } else {
      showDialog(
          context: context,
          builder: ((context) {
            return ResultMessage(
              icon: Icons.rotate_left,
              message: 'Try again!',
              onTap: goBackToQuestion,
            );
          }));
      points = points - 10;
      displayResult = '-10';
      reslutColor = Colors.red;
    }
  }

  //create random numbers
  var randomNumber = Random();

  void goToNextQuestion() {
    Navigator.of(context).pop();
    //reset values
    setState(() {
      userAnswer = '';
    });

    //create a new question
    num1 = randomNumber.nextInt(10);
    num2 = randomNumber.nextInt(10);
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          Container(
              height: 150,
              color: Colors.deepPurple,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Total Points: ' + points.toString(),
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "( " + displayResult +")",
                      style: GoogleFonts.montserrat(
                          color: reslutColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: Container(
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(num1.toString() + " + " + num2.toString() + " = ",
                      style: whiteTextStyle),
                  Container(
                    height: 60,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                        child: Text(
                      userAnswer,
                      style: whiteTextStyle,
                    )),
                  )
                ],
              )),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberPad.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return NumberKey(
                      child: numberPad[index],
                      onTap: () => buttonTapped(numberPad[index]),
                    );
                  },
                ),
              )),
        ],
      ),
    );
  }
}
