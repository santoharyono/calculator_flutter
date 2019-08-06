class CalculatorService {
  int _valueA;
  int _valueB;
  String _operator = '';
  StringBuffer stringBuffer = StringBuffer('0');

  void appendValue(String value) {
    bool isDoCalculate = false;
    if (value == '=') {
      isDoCalculate = true;
    } else if (value == '/' || value == 'x' || value == '-' || value == '+') {
      if (_operator.isEmpty) {
        _operator = value;
      } else {
        isDoCalculate = true;
      }
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
        if (value == '/' || value == 'x' || value == '-' || value == '+') {
          _operator = value;
          stringBuffer.write(value);
        } else {
          _operator = '';
        }
      } else {
        String stringValue = stringBuffer.toString();
        print(stringValue);
        if (value == '/' || value == 'x' || value == '-' || value == '+') {
          stringBuffer.clear();
          stringBuffer.write(
              stringValue.substring(0, stringValue.length - 1) + '' + value);
          _operator = value;
        }
      }
    }
  }

  void deleteValue() {
    String stringValue = stringBuffer.toString();
    if (stringValue.length > 0) {
      String lastChar = stringValue.substring(stringValue.length - 1);
      if (lastChar == '/' ||
          lastChar == 'x' ||
          lastChar == '-' ||
          lastChar == '+') {
        _operator = '';
      }
      stringValue = stringValue.substring(0, stringValue.length - 1);
      stringBuffer.clear();
      stringBuffer.write(stringValue.length == 0 ? '0' : stringValue);
    }
  }

  void clearValue() {
    _operator = '';
    stringBuffer.clear();
    stringBuffer.write('0');
  }
}
