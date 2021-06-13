import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/decoration_color_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/model/shadow_model.dart';
import 'package:eliud_core/style/tools/backgrounds.dart';
import 'package:eliud_core/style/tools/colors.dart';

abstract class EliudShared {
  static BackgroundModel pageBG(String bgName, RgbModel appColor3, RgbModel appColor4,) {
    var decorationColorModels = <DecorationColorModel>[];
    var decorationColorModel1 = DecorationColorModel(
      documentID: '1',
      color: appColor4, // appColor4
    );
    decorationColorModels.add(decorationColorModel1);
    var decorationColorModel2 = DecorationColorModel(
      documentID: '2',
      color: appColor3, // appColor3
    );

    decorationColorModels.add(decorationColorModel2);
    var backgroundModel = BackgroundModel(
      documentID: bgName,
      beginGradientPosition: StartGradientPosition.CenterLeft,
      endGradientPosition: EndGradientPosition.CenterRight,
      decorationColors: decorationColorModels,
    );
    return backgroundModel;
  }

  static BackgroundModel appBarBG(String bgName, RgbModel appColor1, RgbModel appColor2,) {
    return Backgrounds.gradient(
      documentId: bgName,
      fromColor: appColor1,
      toColor: appColor2,
      startPosition: StartGradientPosition.TopLeft,
      endPosition: EndGradientPosition.BottomRight,
    );
  }

  static BackgroundModel drawerBG(String bgName, RgbModel appColor1, RgbModel appColor2, ) {
    var decorationColorModels = <DecorationColorModel>[];
    var decorationColorModel1 =
    DecorationColorModel(documentID: '1', color: appColor2, stop: -1);
    decorationColorModels.add(decorationColorModel1);
    var decorationColorModel2 =
    DecorationColorModel(documentID: '2', color: appColor1, stop: -1);
    decorationColorModels.add(decorationColorModel2);
    var backgroundModel = BackgroundModel(
      documentID: bgName,
      beginGradientPosition: StartGradientPosition.TopLeft,
      endGradientPosition: EndGradientPosition.BottomRight,
      decorationColors: decorationColorModels,
    );
    return backgroundModel;
  }

  static BackgroundModel drawerHeaderBG(String bgName) {
    var decorationColorModels = <DecorationColorModel>[];
    var backgroundModel = BackgroundModel(
        documentID: bgName,
        decorationColors: decorationColorModels);
    return backgroundModel;
  }

  static BackgroundModel profileDrawerBG(String bgName, RgbModel appColor1, RgbModel appColor2) {
    var decorationColorModels = <DecorationColorModel>[];
    var decorationColorModel1 =
    DecorationColorModel(documentID: '1', color: appColor2, stop: -1);
    decorationColorModels.add(decorationColorModel1);
    var decorationColorModel2 =
    DecorationColorModel(documentID: '2', color: appColor1, stop: -1);
    decorationColorModels.add(decorationColorModel2);
    var backgroundModel = BackgroundModel(
      documentID: bgName,
      beginGradientPosition: StartGradientPosition.TopRight,
      endGradientPosition: EndGradientPosition.BottomLeft,
      decorationColors: decorationColorModels,
    );
    return backgroundModel;
  }

  static BackgroundModel homeMenuBG(String bgName, RgbModel appColor1, RgbModel appColor2) {
    // this is a clone of _pageBG
    var decorationColorModels = <DecorationColorModel>[];
    var decorationColorModel1 = DecorationColorModel(
      documentID: '1',
      color: appColor1,
    );
    decorationColorModels.add(decorationColorModel1);
    var decorationColorModel2 = DecorationColorModel(
      documentID: '2',
      color: appColor2,
    );

    decorationColorModels.add(decorationColorModel2);
    var backgroundModel = BackgroundModel(
      documentID: bgName,
      beginGradientPosition: StartGradientPosition.CenterLeft,
      endGradientPosition: EndGradientPosition.CenterRight,
      decorationColors: decorationColorModels,
      shadow: shadowModel(),
    );
    return backgroundModel;
  }

  static ShadowModel shadowModel() {
    var shadowModel = ShadowModel(
        documentID: 'normal_shadow',
        comments: 'Normal shadow',
        color: EliudColors.gray,
        offsetDX: 4,
        offsetDY: 3,
        spreadRadius: 7,
        blurRadius: 7);
    return shadowModel;
  }
}
