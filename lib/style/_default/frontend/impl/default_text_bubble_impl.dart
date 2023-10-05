import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_page_route_builder.dart';
import 'package:eliud_core/tools/router_builders.dart';
import 'package:flutter/material.dart';

import '../../../frontend/has_text_bubble.dart';

class DefaultTextBubbleImpl
    implements HasTextBubble {

  DefaultTextBubbleImpl();

  @override
  Widget textBubble(AppModel app, BuildContext context, {bool isSender = true, required String text, String? time, bool tail = true, Color color = Colors.white70, bool sent = false, bool delivered = false, bool seen = false}) {
    return Text(text);
  }

  @override
  Widget widgetBubble(AppModel app, BuildContext context, {bool isSender = true, required Widget widget, Widget? timeWidget, bool tail = true, bool sent = false, bool delivered = false, bool seen = false}) {
    return widget;
  }
}
