import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Color _primarySwatchColor = Colors.orange;
  final Color _titleAppBarColor = Colors.white;
  final Color _hairlineColor = Colors.grey.shade400;

  int valueA;
  int valueB;
  String operator;
  StringBuffer sb = StringBuffer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sb.write('0');
    operator = "";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: _primarySwatchColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BASIC CALCULATOR',
            style: TextStyle(color: _titleAppBarColor),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                key: Key('upper_expanded_container'),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    AutoSizeText(
                      sb.toString(),
                      style: Theme.of(context).textTheme.display2,
                      maxLines: 1,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                          hairlineColor: _hairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 2,
                          child: CalculatorButtonText(
                            text: 'C',
                            color: _primarySwatchColor,
                          ),
                        ),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: Icon(Icons.backspace)),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '/'))
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '7')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '8')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '9')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: 'X')),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '4')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '5')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '6')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '-')),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '1')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '2')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '3')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '+')),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 3,
                            child: CalculatorButtonText(text: '0')),
                        CalculatorButton(
                            hairlineColor: _hairlineColor,
                            primarySwatchColor: Colors.white,
                            flex: 1,
                            child: CalculatorButtonText(text: '='))
                      ],
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void appendValue(String string) {
    setState(() {
      bool isDoCalculate = false;
      if (string == '=') {
        isDoCalculate = true;
      } else if (string == '/' ||
          string == 'X' ||
          string == '-' ||
          string == '+') {
        operator = string;
      }

      if (!isDoCalculate) {
        sb.write(string);
      } else {
        List<String> values = sb.toString().split(operator);
        if (values.length == 2 &&
            values[0].isNotEmpty &&
            values[1].isNotEmpty) {
          valueA = int.parse(values[0]);
          valueB = int.parse(values[1]);
          sb.clear();
          int total = 0;
          switch (operator) {
            case '/':
              total = valueA ~/ valueB;
              break;
            case 'X':
              total = valueA * valueB;
              break;
            case '-':
              total = valueA - valueB;
              break;
            case '+':
              total = valueA + valueB;
          }
          sb.write(total);
        }
      }
    });
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key key,
      @required Color hairlineColor,
      @required Color primarySwatchColor,
      @required int flex,
      @required Widget child})
      : _hairlineColor = hairlineColor,
        _primarySwatchColor = primarySwatchColor,
        _flex = flex,
        _child = child,
        super(key: key);

  final Color _hairlineColor;
  final Color _primarySwatchColor;
  final int _flex;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        highlightColor: _hairlineColor,
        onPressed: () {},
        child: _child,
        color: _primarySwatchColor,
      ),
      flex: _flex,
    );
  }
}

class CalculatorButtonText extends StatelessWidget {
  final String text;
  final Color color;

  CalculatorButtonText({@required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24.0, color: color),
    );
  }
}
