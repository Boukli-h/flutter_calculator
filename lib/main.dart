import 'package:flutter/material.dart';
import 'calculator_widget.dart';
import 'calculator.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
         primarySwatch:customColor,
     ),
      home: Calculator(),
    );
  }
}