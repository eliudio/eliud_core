import 'package:delayed_display/delayed_display.dart';
import 'package:eliud_core/style/shared/has_progress_indicator.dart';
import 'package:flutter/material.dart';

import '../../eliud_style.dart';

class EliudProgressIndicatorImpl implements HasProgressIndicator {
  final EliudStyle _eliudStyle;

  EliudProgressIndicatorImpl(this._eliudStyle);

  @override
  Widget progressIndicator(BuildContext context, {Animation<Color>? valueColor}) {
    return Center(child: _DelayedCircularProgressIndicator(valueColor: valueColor,));
  }
}

class _DelayedCircularProgressIndicator extends StatelessWidget {
  final Animation<Color>? valueColor;
  _DelayedCircularProgressIndicator({
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