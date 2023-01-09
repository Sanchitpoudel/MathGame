import 'package:flutter/material.dart';

class NumberKey extends StatelessWidget {
  final String child;
  const NumberKey({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          child,
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}
