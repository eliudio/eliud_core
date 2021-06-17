import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/tools/backgrounds.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/style/tools/font_tools.dart';
import '../eliud_style.dart';
import 'eliud_shared.dart';

class EliudIncidamusStyle {
  static final String styleName = 'Incidamus';

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
      documentID: styleName,
      appBackground: pageBG(),
      listBackground: pageBG(),
      formBackground: pageBG(),
      formSubmitButtonColor: EliudColors.red,
      formSubmitButtonTextColor: EliudColors.white,
      formGroupTitleColor: EliudColors.red,
      formFieldTextColor: EliudColors.white,
      formFieldHeaderColor: EliudColors.red,
      formFieldFocusColor: EliudColors.red,
      appBarBG: appBarBG(),
      appBarIconColor: EliudColors.white,
      appBarSelectedIconColor: EliudColors.red,
      appBarMenuBackgroundColor: EliudColors.lightRed,
      bottomNavigationBarBG: bottomNavigationBarBG(),
      listTextItemColor: EliudColors.white,
      floatingButtonForegroundColor: EliudColors.white,
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
      backgroundHomeMenu: backgroundHomeMenu(),
      backgroundColorHomeMenu: homeMenuPopupBGColor(),
      iconColorHomeMenu: homeMenuIconColor(),
      drawerBG: drawerBG(),
      drawerHeaderBG: drawerHeaderBG(),
      profileDrawerBG: profileDrawerBG(),
      profileDrawerHeaderBG: profileDrawerHeaderBG()
    );
  }

  static EliudStyle defaultEliudStyle() {
    return EliudStyle(styleName, _defaultEliudStyleAttributesModel());
  }

  static RgbModel appColor1() => EliudColors.darkRed;
  static RgbModel appColor2() => EliudColors.black;
  static RgbModel appColor3() => EliudColors.darkRed2;
  static RgbModel appColor4() => EliudColors.black;
  static RgbModel homeMenuIconColor() => EliudColors.orange1;
  static RgbModel homeMenuPopupBGColor() => EliudColors.black;

  static BackgroundModel appBarBG() => EliudShared.appBarBG('incidamus-appbar-bg', appColor1(), appColor2());
  static BackgroundModel pageBG() => EliudShared.pageBG('incidamus-page-bg', appColor3(), appColor4());
  static BackgroundModel bottomNavigationBarBG() => EliudShared.bottomNavigationBarBG('incidamus-bottom-navigationbar-bg', appColor1(), appColor2());
  static BackgroundModel drawerBG() => EliudShared.drawerBG('incidamus-drawer-bg', appColor1(), appColor2());
  static BackgroundModel drawerHeaderBG()  => EliudShared.drawerHeaderBG('incidamus-drawer-header-bg');
  static BackgroundModel profileDrawerBG()  => EliudShared.profileDrawerBG('incidamus-profile-drawer-bg', appColor1(), appColor2());
  static BackgroundModel profileDrawerHeaderBG()  => EliudShared.profileDrawerHeaderBG('incidamus-profile-drawer-header-bg');
  static BackgroundModel backgroundHomeMenu() => EliudShared.homeMenuBG('incidamus-homemenu', appColor1(), appColor2());
}
