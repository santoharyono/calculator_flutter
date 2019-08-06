import 'package:auto_size_text/auto_size_text.dart';
import 'package:basic_calculator/constants.dart';
import 'package:basic_calculator/logic/calculator_service.dart';
import 'package:basic_calculator/widgets/calculator_button.dart';
import 'package:basic_calculator/widgets/calculator_button_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  CalculatorService _service = CalculatorService();

  callAppendValue(String value) {
    setState(() {
      if (value == '0' && _service.stringBuffer.toString() == '0') {
        return;
      }

      if (_service.stringBuffer.toString() == '0' && value != '0') {
        _service.stringBuffer.clear();
      }

      _service.appendValue(value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: kPrimarySwatchColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BASIC CALCULATOR',
            style: TextStyle(color: kTitleAppBarColor),
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
                      _service.stringBuffer.toString(),
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
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 2,
                          child: CalculatorButtonText(
                            text: 'C',
                            color: kPrimarySwatchColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _service.clearValue();
                            });
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: Icon(Icons.backspace),
                          onPressed: () {
                            setState(() {
                              _service.deleteValue();
                            });
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '/'),
                          onPressed: () {
                            callAppendValue('/');
                          },
                        )
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '7'),
                          onPressed: () {
                            callAppendValue('7');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '8'),
                          onPressed: () {
                            callAppendValue('8');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '9'),
                          onPressed: () {
                            callAppendValue('9');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: 'x'),
                          onPressed: () {
                            callAppendValue('x');
                          },
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '4'),
                          onPressed: () {
                            callAppendValue('4');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '5'),
                          onPressed: () {
                            callAppendValue('5');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '6'),
                          onPressed: () {
                            callAppendValue('6');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '-'),
                          onPressed: () {
                            callAppendValue('-');
                          },
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '1'),
                          onPressed: () {
                            callAppendValue('1');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '2'),
                          onPressed: () {
                            callAppendValue('2');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '3'),
                          onPressed: () {
                            callAppendValue('3');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '+'),
                          onPressed: () {
                            callAppendValue('+');
                          },
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 3,
                          child: CalculatorButtonText(text: '0'),
                          onPressed: () {
                            callAppendValue('0');
                          },
                        ),
                        CalculatorButton(
                          hairlineColor: kHairlineColor,
                          primarySwatchColor: Colors.white,
                          flex: 1,
                          child: CalculatorButtonText(text: '='),
                          onPressed: () {
                            callAppendValue('=');
                          },
                        )
                      ],
                    ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
