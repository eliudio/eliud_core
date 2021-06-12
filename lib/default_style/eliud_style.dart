import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/style/admin/admin_list_style.dart';
import 'package:eliud_core/style/style.dart';
import 'package:eliud_core/style/tools/backgrounds.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/style/tools/font_tools.dart';
import 'eliud_admin_form_style.dart';
import 'eliud_admin_list_style.dart';

class EliudStyle extends Style {
  static final String _familyName = 'EliudStyle';
  final EliudStyleAttributesModel eliudStyleAttributesModel;

  late EliudAdminFormStyle _adminFormStyle;
  late EliudAdminListStyle _adminListStyle;

  EliudStyle(String styleName, this.eliudStyleAttributesModel) : super(_familyName, styleName, ) {
    _adminFormStyle = EliudAdminFormStyle(this);
    _adminListStyle = EliudAdminListStyle(this);
  }

  @override
  AdminFormStyle adminFormStyle() => _adminFormStyle;
  @override
  AdminListStyle adminListStyle() => _adminListStyle;

  static String key(String styleName) => _familyName + '-' + styleName;

  static Future<EliudStyle> get(String styleName) async {
    var styleAttributesModel = await eliudStyleAttributesRepository()!.get(key(styleName));
    if (styleAttributesModel != null) {
      return EliudStyle(styleName, styleAttributesModel);
    } else {
      throw Exception('Can not find EliudStyleAttributesModel with name $styleName');
    }
  }

}
