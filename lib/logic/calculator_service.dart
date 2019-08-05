class CalculatorService {
  int _valueA;
  int _valueB;
  String _operator;
  StringBuffer stringBuffer = StringBuffer('0');

  void appendValue(String value) {
    bool isDoCalculate = false;
    if (value == '=') {
      isDoCalculate = true;
    } else if (value == '/' || value == 'x' || value == '-' || value == '+') {
      _operator = value;
    }

    if (!isDoCalculate) {
      stringBuffer.write(value);
    } else {
      List<String> values = stringBuffer.toString().split(_operator);
      if (values.length == 2 && values[0].isNotEmpty && values[1].isNotEmpty) {
        _valueA = int.parse(values[0]);
        _valueB = int.parse(values[1]);
        stringBuffer.clear();
        int total = 0;
        switch (_operator) {
          case '/':
            total = _valueA ~/ _valueB;
            break;
          case 'x':
            total = _valueA * _valueB;
            break;
          case '-':
            total = _valueA - _valueB;
            break;
          case '+':
            total = _valueA + _valueB;
        }
        stringBuffer.write(total);
      }
    }
  }
}
