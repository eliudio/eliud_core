import 'package:eliud_core/model/app_model.dart';
import 'package:flutter/material.dart';

import '../style_registry.dart';

abstract class HasText {
  Widget inputDecorationLabel(AppModel app,
      BuildContext context,
      String data, {
        TextAlign? textAlign,
        int? maxLines,
        bool? softWrap,
      });
  Widget smallText(AppModel app,
      BuildContext context,
      String data, {
        TextAlign? textAlign,
        int? maxLines,
        bool? softWrap,
      });
  Widget text(AppModel app,
      BuildContext context,
      String data, {
        TextAlign? textAlign,
        int? maxLines,
        bool? softWrap,
      });
  Widget highLight1(AppModel app,
      BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget highLight2(AppModel app,
      BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h1(AppModel app,
      BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h2(AppModel app,
      BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h3(AppModel app,
      BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h4(AppModel app,
      BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
  Widget h5(AppModel app,
      BuildContext context,
    String data, {
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
  });
}

Widget smallText(AppModel app,
    BuildContext context,
    String data, {
      TextAlign? textAlign,
      int? maxLines,
      bool? softWrap,
    }) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .smallText(app,
      context,
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );

Widget inputDecorationLabel(AppModel app,
    BuildContext context,
    String data, {
      TextAlign? textAlign,
      int? maxLines,
      bool? softWrap,
    }) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .inputDecorationLabel(app,
      context,
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );

Widget text(AppModel app,
    BuildContext context,
    String data, {
      TextAlign? textAlign,
      int? maxLines,
      bool? softWrap,
    }) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .text(app,
      context,
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );

Widget highLight1(AppModel app,
    BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .highLight1(app,
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget highLight2(AppModel app,
    BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .highLight2(app,
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h1(AppModel app,
    BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .h1(app,
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h2(AppModel app,
    BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .h2(app,
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h3(AppModel app,
    BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .h3(app,
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h4(AppModel app,
    BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .h4(app,
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );

Widget h5(AppModel app,
    BuildContext context,
  String data, {
  TextAlign? textAlign,
  int? maxLines,
  bool? softWrap,
}) =>
    StyleRegistry.registry()
        .styleWithApp(app)
        .frontEndStyle()
        .textStyle()
        .h5(app,
          context,
          data,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: softWrap,
        );
