import 'dart:typed_data';

import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class ListHelper {
  static List<String> getStringList(List<String?> list) {
    var newList = <String>[];
    list.forEach((element) {
      if (element != null) newList.add(element);
    });
    return newList;
  }

  static List<MemberMediumModel> getMemberMediumModelList(
      List<MemberMediumModel?> list) {
    var newList = <MemberMediumModel>[];
    list.forEach((element) {
      if (element != null) newList.add(element);
    });
    return newList;
  }

  static List<Uint8List> getUint8List(List<Uint8List?> list) {
    var newList = <Uint8List>[];
    list.forEach((element) {
      if (element != null) newList.add(element);
    });
    return newList;
  }
}

class RgbHelper {
  static Color color({RgbModel? rgbo}) {
    if (rgbo != null) {
      return Color.fromRGBO(rgbo.r!, rgbo.g!, rgbo.b!, rgbo.opacity!);
    } else {
      return Color.fromRGBO(0, 0, 0, 1);
    }
  }
}

class BoxDecorationHelper {
  static Alignment startAlignment(StartGradientPosition? start) {
    switch (start) {
      case StartGradientPosition.TopLeft:
        return Alignment.topLeft;
      case StartGradientPosition.TopCenter:
        return Alignment.topCenter;
      case StartGradientPosition.TopRight:
        return Alignment.topRight;
      case StartGradientPosition.CenterLeft:
        return Alignment.centerLeft;
      case StartGradientPosition.Center:
        return Alignment.center;
      case StartGradientPosition.CenterRight:
        return Alignment.centerRight;
      case StartGradientPosition.BottomLeft:
        return Alignment.bottomLeft;
      case StartGradientPosition.BottomCenter:
        return Alignment.bottomCenter;
      case StartGradientPosition.BottomRight:
        return Alignment.bottomRight;
      case StartGradientPosition.Unknown:
        return Alignment.topCenter;
    }
    return Alignment.topCenter;
  }

  static Alignment endAlignment(EndGradientPosition? endPos) {
    switch (endPos) {
      case EndGradientPosition.TopLeft:
        return Alignment.topLeft;
      case EndGradientPosition.TopCenter:
        return Alignment.topCenter;
      case EndGradientPosition.TopRight:
        return Alignment.topRight;
      case EndGradientPosition.CenterLeft:
        return Alignment.centerLeft;
      case EndGradientPosition.Center:
        return Alignment.center;
      case EndGradientPosition.CenterRight:
        return Alignment.centerRight;
      case EndGradientPosition.BottomLeft:
        return Alignment.bottomLeft;
      case EndGradientPosition.BottomCenter:
        return Alignment.bottomCenter;
      case EndGradientPosition.BottomRight:
        return Alignment.bottomRight;
      case EndGradientPosition.Unknown:
        return Alignment.bottomCenter;
    }
    return Alignment.bottomCenter;
  }

  static BoxDecoration? boxDecoration(AccessState state, BackgroundModel? bdm) {
    if (bdm == null) return null;
    var border = bdm.border != null && bdm.border! ? Border.all() : null;
    var image;
    if ((bdm.useProfilePhotoAsBackground != null) &&
        bdm.useProfilePhotoAsBackground!) {
      var member = state.getMember();
      if (member != null) {
        image = DecorationImage(
            image: NetworkImage(member.photoURL!), fit: BoxFit.scaleDown);
      }
    }
    if (image == null) {
      var imageProvider = (bdm.backgroundImageURL != null)
          ? NetworkImage(bdm.backgroundImageURL!)
          : null;
      image = (imageProvider != null)
          ? DecorationImage(image: imageProvider, fit: BoxFit.scaleDown)
          : null;
    }
    if ((bdm.decorationColors == null) || (bdm.decorationColors!.isEmpty)) {
      if (image == null) {
        return null;
      } else {
        return BoxDecoration(
          image: image,
        );
      }
    } else if (bdm.decorationColors!.length == 1) {
      return BoxDecoration(
        color: RgbHelper.color(rgbo: bdm.decorationColors![0].color),
        image: image,
      );
    } else {
      var colors = bdm.decorationColors!
          .map((color) => RgbHelper.color(rgbo: color.color))
          .toList();
      var stops = bdm.decorationColors!.map((stop) => stop.stop).toList();
      var noStops =
          stops.where((stop) => (stop == null) || (stop < 0)).isNotEmpty;
      var gradient = LinearGradient(
          begin: startAlignment(bdm.beginGradientPosition),
          end: endAlignment(bdm.endGradientPosition),
          colors: colors,
          stops: noStops ? null : stops as List<double>?);

      List<BoxShadow>? boxShadows;
      if (bdm.shadow != null) {
        boxShadows = [];
        boxShadows.add(BoxShadow(
          color: RgbHelper.color(rgbo: bdm.shadow!.color),
          spreadRadius: bdm.shadow!.spreadRadius!,
          blurRadius: bdm.shadow!.blurRadius!,
          offset: Offset(bdm.shadow!.offsetDX!, bdm.shadow!.offsetDY!),
        ));
      }
      return BoxDecoration(
          gradient: gradient,
          image: image,
          border: border,
          boxShadow: boxShadows);
    }
  }
}

class ImageHelper {
  static Widget getImageFromMediumModel(
      {MemberMediumModel? memberMediumModel,
      double? height,
      double? width,
      BoxFit? fit,
      Alignment? alignment}) {
    if (memberMediumModel == null) {
      return Image(
        image: AssetImage('assets/images/image_not_available.png'),
        height: height,
        width: width,
        alignment: alignment!,
      );
    } else {
      return getImageFromURL(
          url: memberMediumModel.url!, height: height, width: width);
    }
  }

  static Widget getThumbnailFromMembereMediumModel(
      {MemberMediumModel? memberMediumModel,
      double? height,
      double? width,
      BoxFit? fit,
      Alignment? alignment}) {
    if (memberMediumModel == null) {
      return Image(
          image: AssetImage('assets/images/image_not_available.png'),
          height: height,
          width: width);
    } else {
      return getImageFromURL(
          url: memberMediumModel.url!, height: height, width: width);
    }
  }

  static Widget getImageFromURL(
      {required String url,
      double? height,
      double? width,
      BoxFit? fit,
      Alignment? alignment}) {
    try {
      return FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: url,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      );
    } catch (_) {
      return Image(
          image: AssetImage('assets/images/image_not_available.png'),
          height: height,
          width: width);
    }
  }
}

class ImageTool {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<dynamic> getImageDownloadURL(String pathName) {
    return firebaseStorage.ref().child(pathName).getDownloadURL();
  }
}

class IconHelper {
  static Icon? getIconFromModel({IconModel? iconModel, RgbModel? color}) {
    if (iconModel == null) {
      return null;
    }
    if (iconModel.fontFamily == null) {
      return Icon(IconData(iconModel.codePoint!, fontFamily: 'MaterialIcons'),
          color: color != null ? RgbHelper.color(rgbo: color) : null);
    }
    return Icon(
        IconData(iconModel.codePoint!, fontFamily: iconModel.fontFamily),
        color: color != null ? RgbHelper.color(rgbo: color) : null);
  }

  static Icon getIconFromModelWithFlutterColor(
      {IconModel? iconModel, Color? color, String? semanticLabel}) {
    if (iconModel == null) return Icon(Icons.touch_app, color: color, semanticLabel: semanticLabel);
    if (iconModel.fontFamily == null) {
      return Icon(IconData(iconModel.codePoint!, fontFamily: 'MaterialIcons'),
          color: color, semanticLabel: semanticLabel);
    }
    return Icon(
        IconData(iconModel.codePoint!, fontFamily: iconModel.fontFamily),
        color: color, semanticLabel: semanticLabel);
  }

  static Icon getIcon(
      {required IconData iconData, Color? color, String? semanticLabel}) {
    return Icon(iconData, color: color, semanticLabel: semanticLabel);
  }
}

class BoxFitHelper {
  static BoxFit? toBoxFit(PosSizeModel posSizeModel, Orientation orientation) {
    if (posSizeModel == null) return null;
    if (orientation == Orientation.landscape) {
      switch (posSizeModel.fitLandscape) {
        case LandscapeFitType.LandscapeFitWidth:
          return BoxFit.fitWidth;
        case LandscapeFitType.LandscapeFitHeight:
          return BoxFit.fitHeight;
        case LandscapeFitType.LandscapeFill:
          return BoxFit.fill;
        case LandscapeFitType.LandscapeNone:
          return BoxFit.none;
        case LandscapeFitType.LandscapeContain:
          return BoxFit.contain;
        case LandscapeFitType.LandscapeCover:
          return BoxFit.cover;
        case LandscapeFitType.LandscapeScaleDown:
          return BoxFit.scaleDown;
        case LandscapeFitType.Unknown:
          return null;
      }
    } else {
      switch (posSizeModel.fitPortrait) {
        case PortraitFitType.PortraitFitWidth:
          return BoxFit.fitWidth;
        case PortraitFitType.PortraitFitHeight:
          return BoxFit.fitHeight;
        case PortraitFitType.PortraitFill:
          return BoxFit.fill;
        case PortraitFitType.PortraitNone:
          return BoxFit.none;
        case PortraitFitType.PortraitContain:
          return BoxFit.contain;
        case PortraitFitType.PortraitCover:
          return BoxFit.cover;
        case PortraitFitType.PortraitScaleDown:
          return BoxFit.scaleDown;
        case PortraitFitType.Unknown:
          return null;
      }
    }
    return null;
  }

  static double? toWidth(PosSizeModel posSizeModel, BuildContext context,
      Orientation orientation) {
    if (posSizeModel == null) return null;
    if (orientation == Orientation.landscape) {
      if (posSizeModel.widthLandscape == 0) return null;
      if (posSizeModel.widthLandscape == null) return null;
      if (posSizeModel.widthTypeLandscape == WidthTypeLandscape.AbsoluteWidth) {
        return posSizeModel.widthLandscape;
      }
      return fullScreenWidth(context) * posSizeModel.widthLandscape!;
    } else {
      if (posSizeModel.widthPortrait == 0) return null;
      if (posSizeModel.widthPortrait == null) return null;
      if (posSizeModel.widthTypePortrait == WidthTypePortrait.AbsoluteWidth) {
        return posSizeModel.widthPortrait;
      }
      return fullScreenWidth(context) * posSizeModel.widthPortrait!;
    }
  }

  static double? toHeight(PosSizeModel posSizeModel, BuildContext context,
      Orientation orientation) {
    if (posSizeModel == null) return null;
    if (orientation == Orientation.landscape) {
      if (posSizeModel.heightLandscape == null) return null;
      if (posSizeModel.heightLandscape == 0) return null;
      if (posSizeModel.heightTypeLandscape ==
          HeightTypeLandscape.AbsoluteHeight) {
        return posSizeModel.heightLandscape;
      }
      return fullScreenHeight(context) * posSizeModel.heightLandscape!;
    } else {
      if (posSizeModel.heightPortrait == 0) return null;
      if (posSizeModel.heightPortrait == null) return null;
      if (posSizeModel.heightTypePortrait ==
          HeightTypePortrait.AbsoluteHeight) {
        return posSizeModel.heightPortrait;
      }
      return fullScreenHeight(context) * posSizeModel.heightPortrait!;
    }
  }

  static Alignment? toAlignment(
      PosSizeModel posSizeModel, Orientation orientation) {
    if (orientation == Orientation.landscape) {
      switch (posSizeModel.alignTypeLandscape) {
        case LandscapeAlignType.LandscapeAlignTopLeft:
          return Alignment.topLeft;
        case LandscapeAlignType.LandscapeAlignTopCenter:
          return Alignment.topCenter;
        case LandscapeAlignType.LandscapeAlignTopRight:
          return Alignment.topRight;
        case LandscapeAlignType.LandscapeAlignCenterLeft:
          return Alignment.centerRight;
        case LandscapeAlignType.LandscapeAlignCenter:
          return Alignment.center;
        case LandscapeAlignType.LandscapeAlignCenterRight:
          return Alignment.centerRight;
        case LandscapeAlignType.LandscapeAlignBottomLeft:
          return Alignment.bottomLeft;
        case LandscapeAlignType.LandscapeAlignBottomCenter:
          return Alignment.bottomCenter;
        case LandscapeAlignType.LandscapeAlignBottomRight:
          return Alignment.bottomRight;
        case LandscapeAlignType.Unknown:
          return Alignment.bottomRight;
      }
    } else {
      switch (posSizeModel.alignTypePortrait) {
        case PortraitAlignType.PortraitAlignTopLeft:
          return Alignment.topLeft;
        case PortraitAlignType.PortraitAlignTopCenter:
          return Alignment.topCenter;
        case PortraitAlignType.PortraitAlignTopRight:
          return Alignment.topRight;
        case PortraitAlignType.PortraitAlignCenterLeft:
          return Alignment.centerRight;
        case PortraitAlignType.PortraitAlignCenter:
          return Alignment.center;
        case PortraitAlignType.PortraitAlignCenterRight:
          return Alignment.centerRight;
        case PortraitAlignType.PortraitAlignBottomLeft:
          return Alignment.bottomLeft;
        case PortraitAlignType.PortraitAlignBottomCenter:
          return Alignment.bottomCenter;
        case PortraitAlignType.PortraitAlignBottomRight:
          return Alignment.bottomRight;
        case PortraitAlignType.Unknown:
          return Alignment.bottomRight;
      }
    }
    return null;
  }
}

class FontTools {
  static FontWeight toFontWeight(EliudFontWeight? eliudFontWeight) {
    if (eliudFontWeight == null) return FontWeight.w400;
    switch (eliudFontWeight) {
      case EliudFontWeight.Thin:
        return FontWeight.w100;
      case EliudFontWeight.ExtraLight:
        return FontWeight.w200;
      case EliudFontWeight.Light:
        return FontWeight.w300;
      case EliudFontWeight.Normal:
        return FontWeight.w400;
      case EliudFontWeight.Medium:
        return FontWeight.w500;
      case EliudFontWeight.SemiBold:
        return FontWeight.w600;
      case EliudFontWeight.Bold:
        return FontWeight.w700;
      case EliudFontWeight.ExtraBold:
        return FontWeight.w800;
      case EliudFontWeight.MostThick:
        return FontWeight.w900;
      case EliudFontWeight.Unknown:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle? textStyle(FontModel? fontModel) {
    if (fontModel == null) return null;
    return GoogleFonts.getFont(fontModel.fontName!,
        fontSize: fontModel.size,
        fontWeight: FontTools.toFontWeight(fontModel.weight),
        color: RgbHelper.color(rgbo: fontModel.color),
        fontStyle: FontStyle.italic);
  }
}

abstract class ListTool<T> {
  static List<T> copyAllExcept<T>(
      List<T> original, bool Function(T t) exclude) {
    var newList = <T>[];
    original.forEach((element) {
      if (!exclude(element)) newList.add(element);
    });
    return newList;
  }

  static List<T> addAllExcept<T>(
      List<T> original, List<T> addHere, bool Function(T t) exclude) {
    original.forEach((element) {
      if (!exclude(element)) addHere.add(element);
    });
    return addHere;
  }
}
