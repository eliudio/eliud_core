import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../../../frontend/has_text_bubble.dart';

class DefaultTextBubbleImpl implements HasTextBubble {
  DefaultTextBubbleImpl();

  @override
  Widget textBubble(AppModel app, BuildContext context,
      {bool isSender = true,
      required String text,
      Widget? widget,
      Widget? button,
      String? time,
      bool tail = true,
      Color color = Colors.white70,
      bool sent = false,
      bool delivered = false,
      bool seen = false}) {
    return Text(text);
  }
}
