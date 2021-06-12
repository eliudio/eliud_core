import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/access_model.dart';
import 'package:eliud_core/model/app_model.dart';
import 'admin/admin_form_style.dart';
import 'admin/admin_list_style.dart';

abstract class Style {
  final String _familyName;
  final String _styleName;

  Style(this._familyName, this._styleName);

  AdminFormStyle adminFormStyle();
  AdminListStyle adminListStyle();

  String familyName() => _familyName;

  String styleName() => _styleName;
}
