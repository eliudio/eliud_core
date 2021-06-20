import 'package:eliud_core/model/background_model.dart';
import 'package:flutter/material.dart';


abstract class HasSimpleAppBar {
  PreferredSizeWidget appBarWithWidget(BuildContext context,
      {required Widget title, List<
          Widget>? actions, IconThemeData? iconTheme, BackgroundModel? backgroundOverride});

  PreferredSizeWidget appBarWithString(BuildContext context,
      {required String title, List<
          Widget>? actions, IconThemeData? iconTheme, BackgroundModel? backgroundOverride});

}
