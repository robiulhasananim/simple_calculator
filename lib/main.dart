import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApps",
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String current_input = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                output,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      button("1"),
                      button("2"),
                      button("3"),
                      button("+"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      button("4"),
                      button("5"),
                      button("6"),
                      button("-"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      button("7"),
                      button("8"),
                      button("9"),
                      button("*"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      button("0"),
                      button("C"),
                      button("="),
                      button("/"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button(String buttonText) {
    return Expanded(
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        output = "0";
        current_input = "";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "*" ||
          buttonText == "/") {
        if (current_input.isNotEmpty) {
                    num1 = double.parse(current_input);
          operator = buttonText;
          current_input = "";
        }
      } else if (buttonText == "=") {
        if (current_input.isNotEmpty && operator.isNotEmpty) {
          num2 = double.parse(current_input);
          double result = 0;
          switch (operator) {
            case "+":
              result = num1 + num2;
              break;
            case "-":
              result = num1 - num2;
              break;
            case "*":
              result = num1 * num2;
              break;
            case "/":
              result = num1 / num2;
              break;
          }
          output = result.toString();
          current_input = result.toString();
          operator = "";
        }
      } else {
        current_input += buttonText;
        output = current_input;
      }
    });
  }
}