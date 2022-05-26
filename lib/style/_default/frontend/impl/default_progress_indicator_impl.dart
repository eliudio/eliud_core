import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:flutter/material.dart';

class DefaultProgressIndicatorImpl implements HasProgressIndicator {
  @override
  Widget progressIndicator(AppModel app, BuildContext context, {Animation<Color>? valueColor}) {
    return Center(child: CircularProgressIndicator(valueColor: valueColor,));
  }

  @override
  Widget progressIndicatorWithValue(AppModel app, BuildContext context, {Animation<Color>? valueColor, required double value}) {
    return Center(child: CircularProgressIndicator(value: value, valueColor: valueColor));
  }
}
