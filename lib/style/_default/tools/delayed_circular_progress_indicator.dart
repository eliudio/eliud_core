import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class DelayedCircularProgressIndicator extends StatelessWidget {
  final Animation<Color>? valueColor;
  DelayedCircularProgressIndicator({
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    Animation<Color>? vColor;
    if (valueColor == null) {
      vColor = AlwaysStoppedAnimation<Color>(Colors.white);
    } else {
      vColor = valueColor;
    }
    return DelayedDisplay(
        delay: Duration(seconds: 1),
        child: CircularProgressIndicator(valueColor: vColor));
  }
}
