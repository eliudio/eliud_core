import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:flutter/material.dart';

abstract class HasSimpleAppBar {
  PreferredSizeWidget appBarWithWidget(AppModel app, BuildContext context,
      {required Widget title,
      List<Widget>? actions,
      IconThemeData? iconTheme,
      BackgroundModel? backgroundOverride});

  PreferredSizeWidget appBarWithString(AppModel app, BuildContext context,
      {required String title,
      List<Widget>? actions,
      IconThemeData? iconTheme,
      BackgroundModel? backgroundOverride});
}
