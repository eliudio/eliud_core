import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/eliud_style_attributes_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/style/tools/backgrounds.dart';
import 'package:eliud_core/style/tools/colors.dart';
import 'package:eliud_core/style/tools/font_tools.dart';
import '../eliud_style.dart';
import 'eliud_shared.dart';

class EliudJuuwleStyle {
  static final String styleName = 'Juuwle';

  static EliudStyleAttributesModel _defaultEliudStyleAttributesModel() {
    var headerColor1To3 = EliudColors.lightBlueTransparent;
    var headerColor4To5 = EliudColors.black;
    var defaultColor = EliudColors.black;
    var highlightColor = EliudColors.ochre;
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
      formFieldTextColor: EliudColors.black,
      formFieldHeaderColor: EliudColors.red,
      formFieldFocusColor: EliudColors.red,
      appBarBG: appBarBG(),
      appBarIconColor: EliudColors.black,
      appBarSelectedIconColor: EliudColors.white,
      appBarMenuBackgroundColor: EliudColors.lightRed,
      bottomNavigationBarBG: bottomNavigationBarBG(),
      listTextItemColor: EliudColors.white,
      floatingButtonForegroundColor: EliudColors.white,
      iconColor: EliudColors.red,
      floatingButtonBackgroundColor: EliudColors.red,
      dividerColor: EliudColors.red,

      h1: fontTools.getFont(
          FontTools.key(FontTools.dancingScriptLabel, FontTools.h1Label)),
      h2: fontTools.getFont(
          FontTools.key(FontTools.dancingScriptLabel, FontTools.h2Label)),
      h3: fontTools.getFont(
          FontTools.key(FontTools.dancingScriptLabel, FontTools.h3Label)),
      h4: fontTools.getFont(
          FontTools.key(FontTools.dancingScriptLabel, FontTools.h4Label)),
      h5: fontTools.getFont(
          FontTools.key(FontTools.dancingScriptLabel, FontTools.h5Label)),
      fontHighlight1: fontTools.getFont(FontTools.key(
          FontTools.dancingScriptLabel, FontTools.highlightLabel1)),
      fontHighlight2: fontTools.getFont(FontTools.key(
          FontTools.dancingScriptLabel, FontTools.highlightLabel2)),
      fontLink: fontTools.getFont(
          FontTools.key(FontTools.dancingScriptLabel, FontTools.linkLabel)),
      fontText: fontTools.getFont(
          FontTools.key(FontTools.dancingScriptLabel, FontTools.normalLabel)),
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

  static RgbModel appColor1() => EliudColors.bordeauxRed;
  static RgbModel appColor2() => EliudColors.ochre;
  static RgbModel appColor3() => EliudColors.ochreTransparent;
  static RgbModel appColor4() => EliudColors.white;
  static RgbModel homeMenuIconColor() => EliudColors.black;
  static RgbModel homeMenuPopupBGColor() => EliudColors.white;

  static BackgroundModel appBarBG() => EliudShared.appBarBG('juuwle-appbar-bg', appColor1(), appColor2());
  static BackgroundModel pageBG() => EliudShared.pageBG('juuwle-page-bg', appColor3(), appColor4());
  static BackgroundModel bottomNavigationBarBG() => EliudShared.bottomNavigationBarBG('juuwle-bottom-navigationbar-bg', appColor1(), appColor2());
  static BackgroundModel drawerBG() => EliudShared.drawerBG('juuwle-drawer-bg', appColor1(), appColor2());
  static BackgroundModel drawerHeaderBG()  => EliudShared.drawerHeaderBG('juuwle-drawer-header-bg');
  static BackgroundModel profileDrawerBG() => EliudShared.profileDrawerBG('juuwle-profile-drawer-bg', appColor1(), appColor2());
  static BackgroundModel profileDrawerHeaderBG()  => EliudShared.profileDrawerBG('juuwle-profile-drawer-bg', appColor1(), appColor2());
  static BackgroundModel backgroundHomeMenu() => EliudShared.homeMenuBG('juuwle-homemenu', appColor1(), appColor2());
}
