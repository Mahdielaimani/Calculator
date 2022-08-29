import 'package:flutter/material.dart';
import '../functions/function.dart';

class Calcul extends ChangeNotifier {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void changeValue(btnText) {
    print("tap");
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add(numOne, numTwo);
      } else if (preOpr == '-') {
        finalResult = sub(numOne, numTwo);
      } else if (preOpr == 'x') {
        finalResult = mul(numOne, numTwo);
      } else if (preOpr == '/') {
        finalResult = div(numOne, numTwo);
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add(numOne, numTwo);
      } else if (opr == '-') {
        finalResult = sub(numOne, numTwo);
      } else if (opr == 'x') {
        finalResult = mul(numOne, numTwo);
      } else if (opr == '/') {
        finalResult = div(numOne, numTwo);
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

     text = finalResult;
    notifyListeners();
   

    print("$text");
  }
}
