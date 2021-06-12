import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/default_style/shared/eliud_shared_implementation.dart';
import 'package:eliud_core/default_style/shared/tools.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/style/frontend/frontend_form_style.dart';
import 'package:eliud_core/style/shared/types.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import '../eliud_style.dart';

class EliudFrontEndFormStyle extends EliudSharedImplementation implements FrontEndFormStyle {
  final EliudStyle _eliudStyle;

  EliudFrontEndFormStyle(this._eliudStyle) : super(_eliudStyle);

  Widget container(BuildContext context, {Widget? child}) {
    var accessState = AccessBloc.getState(context);
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecorationHelper.boxDecoration(
            accessState, _eliudStyle.eliudStyleAttributesModel.formAppBarBackground),
        child: child);
  }
}
