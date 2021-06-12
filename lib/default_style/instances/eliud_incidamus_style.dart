import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/style/tools/backgrounds.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/style/tools/font_tools.dart';
import '../eliud_style.dart';

class EliudIncidamusStyle {
  static final String _defaultStyleName = 'Default';

  static EliudStyleAttributesModel _defaultEliudStyleAttributesModel() {
    var headerColor1To3 = EliudColors.orange1;
    var headerColor4To5 = EliudColors.white;
    var defaultColor = EliudColors.white;
    var highlightColor = EliudColors.orange1;
    var linkColor = EliudColors.orange1;
    var fontTools = FontTools(
        headerColor1To3: headerColor1To3,
        headerColor4To5: headerColor4To5,
        defaultColor: defaultColor,
        highlightColor: highlightColor,
        linkColor: linkColor);
    return EliudStyleAttributesModel(
      formBackground: pageBG(),
      formSubmitButtonColor: EliudColors.red,
      formSubmitButtonTextColor: EliudColors.white,
      formGroupTitleColor: EliudColors.red,
      formFieldTextColor: EliudColors.white,
      formFieldHeaderColor: EliudColors.red,
      formFieldFocusColor: EliudColors.red,
      formAppBarBackground: appBarBG(),
      formAppBarTextColor: EliudColors.white,
      listTextItemColor: EliudColors.white,
      listBackground: pageBG(),
      floatingButtonForegroundColor: EliudColors.white,
      iconColor: EliudColors.red,
      floatingButtonBackgroundColor: EliudColors.red,
      dividerColor: EliudColors.red,
      h1: fontTools
          .getFont(FontTools.key(FontTools.latoLabel, FontTools.h1Label)),
      h2: fontTools
          .getFont(FontTools.key(FontTools.latoLabel, FontTools.h2Label)),
      h3: fontTools
          .getFont(FontTools.key(FontTools.latoLabel, FontTools.h3Label)),
      h4: fontTools
          .getFont(FontTools.key(FontTools.latoLabel, FontTools.h4Label)),
      h5: fontTools
          .getFont(FontTools.key(FontTools.latoLabel, FontTools.h5Label)),
      fontHighlight1: fontTools.getFont(
          FontTools.key(FontTools.latoLabel, FontTools.highlightLabel1)),
      fontHighlight2: fontTools.getFont(
          FontTools.key(FontTools.latoLabel, FontTools.highlightLabel2)),
      fontLink: fontTools
          .getFont(FontTools.key(FontTools.latoLabel, FontTools.linkLabel)),
      fontText: fontTools
          .getFont(FontTools.key(FontTools.latoLabel, FontTools.normalLabel)),
    );
  }

  static EliudStyle defaultEliudStyle() {
    return EliudStyle(_defaultStyleName, _defaultEliudStyleAttributesModel());
  }

  static BackgroundModel appBarBG() {
    return Backgrounds.gradient(
      documentId: 'appbar_bg',
      fromColor: EliudColors.darkRed,               // appColor1
      toColor: EliudColors.black,                   // appColor2
      startPosition: StartGradientPosition.TopLeft,
      endPosition: EndGradientPosition.BottomRight,
    );
  }

  static BackgroundModel pageBG() {
    var decorationColorModels = <DecorationColorModel>[];
    var decorationColorModel1 = DecorationColorModel(
      documentID: '1',
      color: EliudColors.black,                     // appColor4
    );
    decorationColorModels.add(decorationColorModel1);
    var decorationColorModel2 = DecorationColorModel(
      documentID: '2',
    color: EliudColors.darkRed2,                   // appColor3
    );

    decorationColorModels.add(decorationColorModel2);
    var backgroundModel = BackgroundModel(
      documentID: 'page_bg',
      beginGradientPosition: StartGradientPosition.CenterLeft,
      endGradientPosition: EndGradientPosition.CenterRight,
      decorationColors: decorationColorModels,
    );
    return backgroundModel;
  }

}
