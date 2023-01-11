import 'package:flutter/material.dart';

class NumberKey extends StatelessWidget {
  final String child;
  final VoidCallback onTap;

  NumberKey({
    Key? key,
    required this.child,
    required this.onTap,
  }):super(key: key);

  var buttonColor = Colors.deepPurple[600];

  @override
  Widget build(BuildContext context) {
    if (child == 'C') {
      buttonColor = Colors.green[400];
    } else if (child == 'DEL') {
      buttonColor = Colors.red[400];
    } else if (child == "=") {
      buttonColor = Colors.deepPurple[900];
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Text(
            child,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
