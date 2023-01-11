// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';
import 'package:mathgame/util/number_key.dart';

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
            return AlertDialog(
              backgroundColor: Colors.deepPurple,
              content: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Correct!',
                      style: whiteTextStyle,
                    ),
                    GestureDetector(
                      onTap: goToNextQuestion,
                      child: Container(
                        margin: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[300],
                            borderRadius: BorderRadius.circular(2)),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }));
    } else {
      print('Incorrect');
    }
  }
  //create random numbers

  void goToNextQuestion() {
    Navigator.of(context).pop();
    //reset values
    setState(() {
      userAnswer = '';
    });

    //create a new question

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        children: [
          //level progress
          Container(
            height: 150,
            color: Colors.deepPurple,
          ),
          //question
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
          //calculator
        ],
      ),
    );
  }
}
