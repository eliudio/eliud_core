import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';
import '../style_registry.dart';

abstract class HasTextBubble {
  Widget textBubble(
    AppModel app,
    BuildContext context, {
    bool isSender = true,
    required String text,
    Widget? button,
    Widget? widget,
    String? time,
    bool tail = true,
    bool sent = false,
    bool delivered = false,
    bool seen = false,
  });
}

Widget textBubble(
  AppModel app,
  BuildContext context, {
  bool isSender = true,
  required String text,
  Widget? button,
  Widget? widget,
  String? time,
  bool tail = true,
  bool sent = false,
  bool delivered = false,
  bool seen = false,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textBubbleStyle()
        .textBubble(
          app,
          context,
          isSender: isSender,
          text: text,
          button: button,
          widget: widget,
          time: time,
          tail: tail,
          sent: sent,
          delivered: delivered,
          seen: seen,
        );

