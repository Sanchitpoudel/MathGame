import 'package:flutter/material.dart';

class NumberKey extends StatefulWidget {
  final String child;
  final VoidCallback onTap;

  NumberKey({
    Key? key,
    required this.child,
    required this.onTap,
  }):super(key: key);

  @override
  State<NumberKey> createState() => _NumberKeyState();
}

class _NumberKeyState extends State<NumberKey> {
  var buttonColor = Colors.deepPurple[600];

  @override
  Widget build(BuildContext context) {
    if (widget.child == 'C') {
      buttonColor = Colors.green[400];
    } else if (widget.child == 'DEL') {
      buttonColor = Colors.red[400];
    } else if (widget.child == "=") {
      buttonColor = Colors.deepPurple[900];
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
              child: Text(
            widget.child,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ),
      ),
    );
  }
}
