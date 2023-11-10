import 'package:math_expressions/math_expressions.dart';

class CalculationService {
  static dynamic calculate(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression.replaceAll('X', '*'));
      ContextModel cm = ContextModel();
      final result = exp.evaluate(EvaluationType.REAL, cm);
      if (result is int) {
        //if result it integer return it as int
        return result;
        // if result is a whole number return it as integer
      } else if (result is double) {
        if (result % 1 == 0) {
          return result.toInt();
        } //in case the result is double return it as double
        return result;
      }
    } catch (e) {
      return double.nan; // Handle error cases as needed
    }
  }
}
