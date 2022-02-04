import 'package:eliud_core/model/model_export.dart';
import 'package:flutter/cupertino.dart';

class Backgrounds {
  static BackgroundModel _construct({String? appId, RgbModel? fromColor, RgbModel? toColor, ShadowModel? withShadow, StartGradientPosition? startPosition, EndGradientPosition? endPosition, }) {
    var decorationColorModels = <DecorationColorModel>[];
    var decorationColorModel1 = DecorationColorModel(
      documentID: "1",
      color: fromColor,
      stop: .1
    );
    decorationColorModels.add(decorationColorModel1);
    var decorationColorModel2 = DecorationColorModel(
      documentID: "2",
      color: toColor,
      stop: .9
    );

    decorationColorModels.add(decorationColorModel2);
    var backgroundModel = BackgroundModel(
      beginGradientPosition: startPosition != null ? startPosition : StartGradientPosition.CenterLeft,
      endGradientPosition: endPosition != null ? endPosition : EndGradientPosition.CenterRight,
      decorationColors: decorationColorModels,
      shadow: withShadow,
    );
    return backgroundModel;
  }

  static BackgroundModel gradient({String? appId, RgbModel? fromColor, RgbModel? toColor, ShadowModel? withShadow, StartGradientPosition? startPosition, EndGradientPosition? endPosition, }) {
    return _construct(appId: appId, fromColor: fromColor, toColor: toColor, withShadow: withShadow, startPosition: startPosition, endPosition: endPosition);
  }

  static BackgroundModel solid(String appId, RgbModel color, ShadowModel withShadow) {
    return _construct(appId: appId, fromColor: color, toColor: color, withShadow: withShadow);
  }
}
