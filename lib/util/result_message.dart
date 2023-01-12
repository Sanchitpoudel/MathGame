import 'package:flutter/material.dart';
import 'package:mathgame/const.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;
  ResultMessage(
      {super.key,
      required this.message,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              message,
              style: whiteTextStyle,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(2)),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
