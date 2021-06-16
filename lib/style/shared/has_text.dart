import 'package:flutter/material.dart';

abstract class HasText {
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

