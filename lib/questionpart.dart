import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';

class Question extends StatefulWidget {
  Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
    String userAnswer = '3';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1 + 1 =  ', style: whiteTextStyle),
            Container(
              height: 60,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text(userAnswer,style: whiteTextStyle,)),
            )
          ],
        )),
      ),
    );
  }
}
