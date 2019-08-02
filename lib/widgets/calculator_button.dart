import 'package:flutter/material.dart';

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
