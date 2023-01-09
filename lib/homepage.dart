// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mathgame/calculatorpart.dart';
import 'package:mathgame/const.dart';
import 'package:mathgame/questionpart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          Question(),
          Calculator()
          //calculator
        ],
      ),
    );
  }
}
