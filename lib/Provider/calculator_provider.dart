import 'package:calculator/Model/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _userInput = '';
  String get userInput => _userInput;
  String _answer = '0';

  String get answer => _answer;
  List<CalModel> numberList = [
    CalModel(
      val: 'AC',
    ),
    CalModel(
      val: '←',
    ),
    CalModel(
      val: '+/-',
    ),
    CalModel(
      val: '÷',
    ),
    CalModel(
      val: '7',
    ),
    CalModel(
      val: '8',
    ),
    CalModel(
      val: '9',
    ),
    CalModel(
      val: 'x',
    ),
    CalModel(
      val: '4',
    ),
    CalModel(
      val: '5',
    ),
    CalModel(
      val: '6',
    ),
    CalModel(
      val: '-',
    ),
    CalModel(
      val: '1',
    ),
    CalModel(
      val: '2',
    ),
    CalModel(
      val: '3',
    ),
    CalModel(
      val: '+',
    ),
    CalModel(
      val: '%',
    ),
    CalModel(
      val: '0',
    ),
    CalModel(
      val: '.',
    ),
    CalModel(
      val: '=',
    ),
  ];

  clearData({required String input, required String ans}) {
    _userInput = input;
    _answer = ans;
    notifyListeners();
  }

  percentData({required String input}) {
    _userInput += input;
    notifyListeners();
  }

  deletData() {
    if (_userInput.length > 0) {
      _userInput = _userInput.substring(0, _userInput.length - 1);
    }
    notifyListeners();
  }

  equalData({required String input}) {
    String finalInput = _userInput;
    if (_userInput.contains('x')) {
      finalInput = _userInput.replaceAll('x', '*');
    } else if (_userInput.contains('÷')) {
      finalInput = _userInput.replaceAll('÷', '/');
    }

    Parser p = Parser();
    Expression exp = p.parse(finalInput);
    ContextModel context = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, context);
    _answer = eval.toString();
    notifyListeners();
  }

  bool isOperator(String x) {
    if (x == '÷' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
