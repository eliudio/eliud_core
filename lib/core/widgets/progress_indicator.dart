import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DelayedCircularProgressIndicator extends StatelessWidget {
  final Animation<Color> valueColor;
  DelayedCircularProgressIndicator({
    this.valueColor,
  });
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
        delay: Duration(seconds: 1),
        child:CircularProgressIndicator(valueColor: valueColor)
    );
  }
}