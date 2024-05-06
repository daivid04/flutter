import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: 100,
            height: 100,
            // child: const TextField(
            //   readOnly: true,
            // ),
          ),
          Container(
            color: Colors.blue,
            height: 100,
            width: 200,
          )
        ],
      ),
    );
  }
}