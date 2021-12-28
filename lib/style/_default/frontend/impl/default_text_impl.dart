import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

class DefaultTextImpl implements HasText {
  @override
  Widget text(AppModel app, BuildContext context, String data,
      {TextAlign? textAlign, int? maxLines, bool? softWrap}) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  @override
  Widget smallText(AppModel app, BuildContext context, String data,
      {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);

  @override
  Widget inputDecorationLabel(AppModel app, BuildContext context, String data,
      {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);

  @override
  Widget highLight1(AppModel app, BuildContext context, String data,
      {TextAlign? textAlign, int? maxLines, bool? softWrap}) {
    return Text(data,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: TextStyle(fontWeight: FontWeight.bold));
  }

  @override
  Widget highLight2(AppModel app, BuildContext context, String data,
          {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);
  @override
  Widget h1(AppModel app, BuildContext context, String data,
          {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);
  @override
  Widget h2(AppModel app, BuildContext context, String data,
          {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);
  @override
  Widget h3(AppModel app, BuildContext context, String data,
          {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);
  @override
  Widget h4(AppModel app, BuildContext context, String data,
          {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);
  @override
  Widget h5(AppModel app, BuildContext context, String data,
          {TextAlign? textAlign, int? maxLines, bool? softWrap}) =>
      text(app, context, data,
          textAlign: textAlign, maxLines: maxLines, softWrap: softWrap);
}
