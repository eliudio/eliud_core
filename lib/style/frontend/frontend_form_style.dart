import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/shared/interfaces.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:eliud_core/core/navigate/navigate_bloc.dart';
import 'package:eliud_core/model/member_model.dart';

abstract class FrontEndFormStyle implements HasTexFormField, HasDivider, HasButton, HasText, HasStyle, HasIcon, HasTable, HasAppBar, HasBottomNavigationBar {
  Widget container(BuildContext context, {Widget child});
}
