import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/style_family.dart';
import 'admin/admin_form_style.dart';
import 'admin/admin_list_style.dart';
import 'frontend/frontend_style.dart';

abstract class Style {
  final StyleFamily styleFamily;
  final String styleName;

  Style(this.styleFamily, this.styleName);

  AdminFormStyle adminFormStyle();
  AdminListStyle adminListStyle();
  FrontEndStyle frontEndStyle();
}
