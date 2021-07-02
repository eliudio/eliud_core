import 'package:delayed_display/delayed_display.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/material.dart';

class EliudProgressIndicatorImpl implements HasProgressIndicator {
  final Style _style;

  EliudProgressIndicatorImpl(this._style);

  @override
  Widget progressIndicator(BuildContext context, {Animation<Color>? valueColor}) {
    return Center(child: DelayedCircularProgressIndicator(valueColor: valueColor,));
  }
}

class DelayedCircularProgressIndicator extends StatelessWidget {
  final Animation<Color>? valueColor;
  DelayedCircularProgressIndicator({
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    var vColor;
    if (valueColor == null) {
      vColor = new AlwaysStoppedAnimation<Color>(Colors.white);
    } else {
      vColor = valueColor;
    }
    return DelayedDisplay(
        delay: Duration(seconds: 1),
        child:CircularProgressIndicator(valueColor: vColor)
    );
  }
}