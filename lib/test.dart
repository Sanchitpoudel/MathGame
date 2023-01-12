import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

bool _isElevated = true;

class _ButtonState extends State<Button> {
  onTap() {
    setState(() {
      _isElevated = !_isElevated;
    });
  }

  double ht = 40;

  double wd = 80;
  var color1 = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: onTap,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: _isElevated
                        ? [
                            BoxShadow(
                                color: Colors.grey[400]!,
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ]
                        : [
                            BoxShadow(
                                color: Color.fromARGB(255, 216, 202, 202),
                                offset: Offset(4, 4),
                                blurRadius: 15,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4, -4),
                                blurRadius: 15,
                                spreadRadius: 1)
                          ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
