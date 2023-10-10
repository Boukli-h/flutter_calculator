import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String result = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = '';
  String tempResult = '';
  String operation = '';

  // Function to toggle the sign of a given input string
  String toggleSign(String input) {
    if (input.isEmpty || input == '0') {
      return input;
    }

    if (input.startsWith('-')) {
      return input.substring(1);
    } else {
      return '-$input';
    }
  }

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
          operation = '$num1 $operator ';
          result = num1.toString();
        }
        operator = buttonText;
      } else {
        operator = buttonText;
        num1 = double.parse(result);
        operation = '$num1 $operator ';
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
          operation = '$operation$num2 = ';
          result = num1.toString();
          operator = '';
        }
      }
    } 
    else if (buttonText == '(-)') {
    // Toggle the sign of the current input
    tempResult = toggleSign(tempResult);
    result = tempResult;
  } 
  else if (buttonText == '%') {
    double value = double.parse(tempResult);
    value = value / 100;
    tempResult = value.toString();
    result = tempResult;
  }
  else {
      result += buttonText;
    }
    
    setState(() {
      tempResult = result;
    });
  }
   Widget buildButton(String buttonText, double buttonWidth, double buttonHeight) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: OutlinedButton(
            onPressed: () => buttonPressed(buttonText),
            style: OutlinedButton.styleFrom(
  backgroundColor: ['/', 'x', '-', '+', '%', '(-)'].contains(buttonText) 
  ? Colors.red[100] :buttonText == '=' 
  ? Colors.green: Colors.white,
  foregroundColor: buttonText == '=' 
  ? Colors.white : Colors.green,
),
            child: Text(
              buttonText,
              style: 
              TextStyle(fontWeight: FontWeight.bold,
               color: buttonText == 'C' 
               ? Colors.red : buttonText == '=' 
               ? Colors.white : Colors.green,
              fontSize: 30.0,),
            ),
          ),
        ),
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('QuickDigits', 
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25.0),
        ),
      ),
      body: LayoutBuilder(
      builder: (context, constraints) {
        final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
        final availableHeight = isPortrait 
        ? constraints.maxHeight * 0.9 : constraints.maxHeight;
        final availableWidth = isPortrait 
        ? constraints.maxWidth * 0.9 : constraints.maxWidth;
        final buttonHeight = availableHeight * 0.12;
        final buttonWidth = availableWidth * 0.24;
        
        return OrientationBuilder(
        builder: (context, orientation) {
            return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
             Container(
              height: isPortrait
      ? constraints.maxHeight * 0.25  // Adjust the factor (0.5) to your preference
      : constraints.maxHeight,
               alignment: Alignment.centerRight,
               padding: EdgeInsets.fromLTRB(
                 12.0,
                 isPortrait ? 8.0 : 24.0,
                 12.0,
                 isPortrait ? 8.0 : 24.0,
               ),
               child: Text(
                 operation + (tempResult == '0' ? '' : tempResult),
                 style: TextStyle(fontSize: tempResult.length > 10 ? 36.0 : 48.0),
               ),
             ),

              const SizedBox(height: 20.0,),
              Row(
                children: <Widget>[
                  buildButton('C',buttonWidth, buttonHeight),
                    buildButton('%',buttonWidth, buttonHeight),
                    buildButton('(-)',buttonWidth, buttonHeight),
                    buildButton('/',buttonWidth, buttonHeight),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('7',buttonWidth, buttonHeight),
                  buildButton('8',buttonWidth, buttonHeight),
                  buildButton('9',buttonWidth, buttonHeight),
                  buildButton('x',buttonWidth, buttonHeight),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('4',buttonWidth, buttonHeight),
                  buildButton('5',buttonWidth, buttonHeight),
                  buildButton('6',buttonWidth, buttonHeight),
                  buildButton('-',buttonWidth, buttonHeight),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('1',buttonWidth, buttonHeight),
                  buildButton('2',buttonWidth, buttonHeight),
                  buildButton('3',buttonWidth, buttonHeight),
                  buildButton('+',buttonWidth, buttonHeight),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton('.',buttonWidth, buttonHeight),
                  buildButton('0',buttonWidth, buttonHeight),
                  buildButton('<',buttonWidth, buttonHeight),
                  buildButton('=',buttonWidth, buttonHeight),
                ],
              ),
            ],
          ),
        );
      });
}));
}
}
