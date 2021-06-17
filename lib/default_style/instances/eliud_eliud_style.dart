import 'package:eliud_core/default_style/instances/eliud_shared.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/tools/backgrounds.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/style/tools/font_tools.dart';
import '../eliud_style.dart';

class EliudEliudStyle {
  static final String styleName = 'Eliud';

  static EliudStyleAttributesModel _defaultEliudStyleAttributesModel() {
    var headerColor1To3 = EliudColors.red;
    var headerColor4To5 = EliudColors.white;
    var defaultColor = EliudColors.black;
    var highlightColor = EliudColors.green;
    var linkColor = EliudColors.ochre;
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
      appBarMenuBackgroundColor: EliudColors.gray,
      bottomNavigationBarBG: bottomNavigationBarBG(),
      listTextItemColor: EliudColors.white,
      floatingButtonForegroundColor: EliudColors.white,
      floatingButtonBackgroundColor: EliudColors.red,
      dividerColor: EliudColors.red,
      h1: fontTools
          .getFont(FontTools.key(FontTools.robotoLabel, FontTools.h1Label)),
      h2: fontTools
          .getFont(FontTools.key(FontTools.robotoLabel, FontTools.h2Label)),
      h3: fontTools
          .getFont(FontTools.key(FontTools.robotoLabel, FontTools.h3Label)),
      h4: fontTools
          .getFont(FontTools.key(FontTools.robotoLabel, FontTools.h4Label)),
      h5: fontTools
          .getFont(FontTools.key(FontTools.robotoLabel, FontTools.h5Label)),
      fontHighlight1: fontTools.getFont(
          FontTools.key(FontTools.robotoLabel, FontTools.highlightLabel1)),
      fontHighlight2: fontTools.getFont(
          FontTools.key(FontTools.robotoLabel, FontTools.highlightLabel2)),
      fontLink: fontTools
          .getFont(FontTools.key(FontTools.robotoLabel, FontTools.linkLabel)),
      fontText: fontTools
          .getFont(FontTools.key(FontTools.robotoLabel, FontTools.normalLabel)),
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

  static RgbModel appColor1() => EliudColors.gray;
  static RgbModel appColor2() => EliudColors.blackTransparent;
  static RgbModel appColor3() => EliudColors.gray;
  static RgbModel appColor4() => EliudColors.gray;
  static RgbModel homeMenuIconColor() => EliudColors.white;
  static RgbModel homeMenuPopupBGColor() => EliudColors.lightRed;

  static BackgroundModel appBarBG() => EliudShared.appBarBG('eliud-appbar-bg', appColor1(), appColor2());
  static BackgroundModel pageBG() => EliudShared.pageBG('eliud-page-bg', appColor3(), appColor4());
  static BackgroundModel bottomNavigationBarBG() => EliudShared.bottomNavigationBarBG('eliud-bottom-navigationbar-bg', appColor1(), appColor2());
  static BackgroundModel drawerBG() => EliudShared.drawerBG('eliud-drawer-bg', appColor1(), appColor2());
  static BackgroundModel drawerHeaderBG()  => EliudShared.drawerHeaderBG('eliud-drawer-header-bg');
  static BackgroundModel profileDrawerBG()  => EliudShared.profileDrawerBG('eliud-profile-drawer-bg', appColor1(), appColor2());
  static BackgroundModel profileDrawerHeaderBG()  => EliudShared.profileDrawerHeaderBG('eliud-profile-drawer-header-bg');
  static BackgroundModel backgroundHomeMenu() => EliudShared.homeMenuBG('eliud-homemenu', appColor1(), appColor2());
}
