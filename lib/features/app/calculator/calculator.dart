import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  static const routeName = '/calculator';

  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic displayText = '0';
  double numOne = 0;
  double numTwo = 0;
  String result = '';
  String operator = '';
  String previousOperator = '';

  // void handleButtonPress(String buttonText) {
  //   setState(() {
  //     if (buttonText == 'AC') {
  //       resetCalculator();
  //     } else if (buttonText == '+/-') {
  //       toggleSign();
  //     } else if (buttonText == '%') {
  //       handlePercentage();
  //     } else if (buttonText == '.') {
  //       handleDecimal();
  //     } else if (buttonText == '=') {
  //       calculateResult();
  //     } else {
  //       appendToInput(buttonText);
  //     }
  //   });
  // }

  void resetCalculator() {
    numOne = 0;
    numTwo = 0;
    result = '';
    displayText = '0';
    operator = '';
    previousOperator = '';
  }

  void toggleSign() {
    displayText = (displayText.startsWith('-'))
        ? displayText.substring(1)
        : '-' + displayText;
  }

  void handlePercentage() {
    displayText = (numOne / 100).toString();
    result = formatResult(displayText);
  }

  void handleDecimal() {
    if (!displayText.contains('.')) {
      displayText += '.';
    }
  }

  void handleButtonPress(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        resetCalculator();
      } else if (buttonText == '+/-') {
        toggleSign();
      } else if (buttonText == '%') {
        handlePercentage();
      } else if (buttonText == '.') {
        handleDecimal();
      } else if (buttonText == '=') {
        calculateResult();
      } else {
        appendToInput(buttonText);
      }
    });
  }

  double add() {
    return numOne + numTwo;
  }

  double sub() {
    return numOne - numTwo;
  }

  double mul() {
    return numOne * numTwo;
  }

  double div() {
    return numOne / numTwo;
  }

  void calculateResult() {
    if (numOne != 0 && operator.isNotEmpty) {
      numTwo = double.parse(displayText);

      switch (operator) {
        case '+':
          result = add().toString();
          break;
        case '-':
          result = sub().toString();
          break;
        case 'x':
          result = mul().toString();
          break;
        case '/':
          if (numTwo != 0) {
            result = div().toString();
          } else {
            result = 'Error';
          }
          break;
      }

      resetCalculator();
      displayText = formatResult(result);
    }
  }

  void appendToInput(String buttonText) {
    if (result == 'Error') {
      result = '';
    }

    if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      if (numOne == 0) {
        numOne = double.parse(displayText);
        operator = buttonText;
      } else {
        operator = buttonText;
      }
    } else {
      displayText =
          (displayText == '0') ? buttonText : displayText + buttonText;
    }
  }

  String formatResult(String value) {
    if (value.contains('.') && value.split('.')[1] == '0') {
      return value.split('.')[0];
    }
    return value;
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        handleButtonPress(buttonText);
      },
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        onPrimary: textColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$displayText',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton('C', Colors.grey, Colors.black),
                buildButton('@', Colors.grey, Colors.black),
                buildButton('%', Colors.grey, Colors.black),
                buildButton(
                    '/', const Color.fromARGB(255, 255, 164, 6), Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton(
                    '7', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '8', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '9', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    'x', const Color.fromARGB(255, 255, 162, 0), Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton(
                    '4', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '5', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '6', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '-', const Color.fromARGB(255, 238, 151, 0), Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton(
                    '1', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '2', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '3', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '+', const Color.fromARGB(255, 255, 162, 0), Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Button Zero
                ElevatedButton(
                  onPressed: () {
                    handleButtonPress('0');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[850],
                    onPrimary: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                buildButton(
                    '.', const Color.fromARGB(255, 58, 58, 58), Colors.white),
                buildButton(
                    '=', const Color.fromARGB(255, 255, 163, 4), Colors.white),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
