import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasText {
  Widget smallText(
      BuildContext context,
      String data, {
        TextAlign? textAlign,
        int? maxLines,
        bool? softWrap,
      });
  Widget text(
      BuildContext context,
      String data, {
        TextAlign? textAlign,
        int? maxLines,
        bool? softWrap,
      });
  Widget highLight1(
    BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget highLight2(
    BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h1(
    BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h2(
    BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h3(
    BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h4(
    BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h5(
    BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
}

Widget smallText(
    BuildContext context,
    String data, {
      TextAlign? textAlign,
      int? maxLines,
      bool? softWrap,
    }) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .smallText(
      context,
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );

Widget text(
    BuildContext context,
    String data, {
      TextAlign? textAlign,
      int? maxLines,
      bool? softWrap,
    }) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .text(
      context,
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );

Widget highLight1(
  BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .highLight1(
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget highLight2(
  BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .highLight2(
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h1(
  BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .h1(
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h2(
  BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .h2(
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h3(
  BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .h3(
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h4(
  BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .h4(
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h5(
  BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithContext(context)
        .frontEndStyle()
        .textStyle()
        .h5(
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );
