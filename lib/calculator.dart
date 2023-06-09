import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = '';
  String tempResult = '';
  String operation = '';

  @override
  void initState() {
    super.initState();
    result = '0';
  }


  void buttonPressed(String buttonText) {
    if (result == '0') {
      result = '';
    }

    if (buttonText == 'C') {
      result = '0';
      num1 = 0.0;
      num2 = 0.0;
      operator = '';
      tempResult = '';
      operation = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      if (operator != '') {
        if (tempResult != '') {
          num2 = double.parse(tempResult);
          tempResult = '';
          switch (operator) {
            case '+':
              num1 = num1 + num2;
              break;
            case '-':
              num1 = num1 - num2;
              break;
            case 'x':
              num1 = num1 * num2;
              break;
            case '/':
              num1 = num1 / num2;
              break;
          }
          operation = num1.toString() + ' ' + operator + ' ';
          result = num1.toString();
        }
        operator = buttonText;
      } else {
        operator = buttonText;
        num1 = double.parse(result);
        operation = num1.toString() + ' ' + operator + ' ';
        result = '0';
      }
    } else if (buttonText == '.') {
      if (!result.contains('.')) {
        result += '.';
      }
    } else if (buttonText == '=') {
      if (operator != '') {
        if (tempResult != '') {
          num2 = double.parse(tempResult);
          tempResult = '';
          switch (operator) {
            case '+':
              num1 = num1 + num2;
              break;
            case '-':
              num1 = num1 - num2;
              break;
            case 'x':
              num1 = num1 * num2;
              break;
            case '/':
              num1 = num1 / num2;
              break;
          }
          operation = operation + num2.toString() + ' = ';
          result = num1.toString();
          operator = '';
        }
      }
    } else {
      result += buttonText;
    }

    setState(() {
      tempResult = result;
    });
  }

  
  
   Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 75.0,
          height: 50.0,
          child: OutlinedButton(
            onPressed: () => buttonPressed(buttonText),
            child: Text(
              buttonText,
              style: 
              TextStyle(fontWeight: FontWeight.bold,
               color: buttonText == 'C' ? Colors.red : buttonText == '=' ? Colors.white : Colors.green,
              fontSize: 30.0,),
              
            ),
            style: OutlinedButton.styleFrom(
            backgroundColor: buttonText == '=' ? Colors.green: Colors.white,
            foregroundColor: buttonText == '=' ? Colors.white : Colors.green,
          ),
          
            
          ),
        ),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Directionality(
      textDirection: TextDirection.ltr, 
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calculator', 
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0),
           
          ),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Text(
                    operation + (tempResult == '0' ? '' : tempResult),
                    style: TextStyle(fontSize: 48.0),
                  ),
                ),
                SizedBox(height: 20.0,),
        
                Row(
                  children: <Widget>[
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('/'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('x'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('-'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton('.'),
                    buildButton('0'),
                    buildButton('C'),
                    buildButton('+'),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: <Widget>[
                    buildButton('='),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}
