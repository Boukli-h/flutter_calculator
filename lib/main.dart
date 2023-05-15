import 'package:flutter/material.dart';
import 'calculator.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch:Colors.green,
         appBarTheme: AppBarTheme(
        color: Colors.green, // Set the background color of the AppBar
    ),
     ),
     
      home: Calculator(),
    );
  }
}