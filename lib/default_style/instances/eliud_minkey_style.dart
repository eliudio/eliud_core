import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/tools/backgrounds.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/style/tools/font_tools.dart';
import '../eliud_style.dart';
import 'eliud_shared.dart';

class EliudMinkeyStyle {
  static final String styleName = 'Minkey';

  static EliudStyleAttributesModel _defaultEliudStyleAttributesModel() {
    var headerColor1To3 = EliudColors.white;
    var headerColor4To5 = EliudColors.black;
    var defaultColor = EliudColors.black;
    var highlightColor = EliudColors.red;
    var linkColor = EliudColors.white;
    var fontTools = FontTools(
        headerColor1To3: headerColor1To3,
        headerColor4To5: headerColor4To5,
        defaultColor: defaultColor,
        highlightColor: highlightColor,
        linkColor: linkColor);
    return EliudStyleAttributesModel(
      appBackground: pageBG(),
      listBackground: pageBG(),
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
    return EliudStyle(styleName, _defaultEliudStyleAttributesModel());
  }

  static RgbModel appColor1() => EliudColors.red;
  static RgbModel appColor2() => EliudColors.white;
  static RgbModel appColor3() => EliudColors.lightRed;
  static RgbModel appColor4() => EliudColors.white;

  static BackgroundModel appBarBG() => EliudShared.drawerBG('minkey-appbar-bg', appColor1(), appColor2());
  static BackgroundModel pageBG() => EliudShared.pageBG('minkey-page-bg', appColor3(), appColor4());
  static BackgroundModel drawerBG() => EliudShared.drawerBG('minkey-drawer-bg', appColor1(), appColor2());
  static BackgroundModel drawerHeaderBG()  => EliudShared.drawerHeaderBG('minkey-drawer-header-bg');
  static BackgroundModel profileDrawerHeaderBG()  => EliudShared.profileDrawerBG('minkey-profile-drawer-bg', appColor1(), appColor2());

  }
