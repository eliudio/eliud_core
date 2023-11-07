import 'dart:typed_data';

import 'package:eliud_core/model/background_model.dart';
import 'package:eliud_core/model/border_radius_model.dart';
import 'package:eliud_core/model/icon_model.dart';
import 'package:eliud_core/model/member_medium_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/model/platform_medium_model.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/rgb_model.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/app_model.dart';
import '../model/edge_insets_geometry_model.dart';

class ListHelper {
  static List<String> getStringList(List<String?> list) {
    var newList = <String>[];
    for (var element in list) {
      if (element != null) newList.add(element);
    }
    return newList;
  }

  static List<MemberMediumModel> getMemberMediumModelList(
      List<MemberMediumModel?> list) {
    var newList = <MemberMediumModel>[];
    for (var element in list) {
      if (element != null) newList.add(element);
    }
    return newList;
  }

  static List<PlatformMediumModel> getPlatformMediumModelList(
      List<PlatformMediumModel?> list) {
    var newList = <PlatformMediumModel>[];
    for (var element in list) {
      if (element != null) newList.add(element);
    }
    return newList;
  }

  static List<PublicMediumModel> getPublicMediumModelList(
      List<PublicMediumModel?> list) {
    var newList = <PublicMediumModel>[];
    for (var element in list) {
      if (element != null) newList.add(element);
    }
    return newList;
  }

  static List<Uint8List> getUint8List(List<Uint8List?> list) {
    var newList = <Uint8List>[];
    for (var element in list) {
      if (element != null) newList.add(element);
    }
    return newList;
  }

  static bool listEquals<T>(List<T> list1, List<T> list2) {
    for (T obj in list1) {
      if (!list2.contains(obj)) {
        return false;
      }
    }

    for (T obj in list2) {
      if (!list1.contains(obj)) {
        /* ... this object was added ... */
        return false;
      }
    }
    return true;
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
      case StartGradientPosition.topLeft:
        return Alignment.topLeft;
      case StartGradientPosition.topCenter:
        return Alignment.topCenter;
      case StartGradientPosition.topRight:
        return Alignment.topRight;
      case StartGradientPosition.centerLeft:
        return Alignment.centerLeft;
      case StartGradientPosition.center:
        return Alignment.center;
      case StartGradientPosition.centerRight:
        return Alignment.centerRight;
      case StartGradientPosition.bottomLeft:
        return Alignment.bottomLeft;
      case StartGradientPosition.bottomCenter:
        return Alignment.bottomCenter;
      case StartGradientPosition.bottomRight:
        return Alignment.bottomRight;
      case StartGradientPosition.unknown:
        return Alignment.topCenter;
      case null:
        return Alignment.topCenter;
    }
  }

  static Alignment endAlignment(EndGradientPosition? endPos) {
    switch (endPos) {
      case EndGradientPosition.topLeft:
        return Alignment.topLeft;
      case EndGradientPosition.topCenter:
        return Alignment.topCenter;
      case EndGradientPosition.topRight:
        return Alignment.topRight;
      case EndGradientPosition.centerLeft:
        return Alignment.centerLeft;
      case EndGradientPosition.center:
        return Alignment.center;
      case EndGradientPosition.centerRight:
        return Alignment.centerRight;
      case EndGradientPosition.bottomLeft:
        return Alignment.bottomLeft;
      case EndGradientPosition.bottomCenter:
        return Alignment.bottomCenter;
      case EndGradientPosition.bottomRight:
        return Alignment.bottomRight;
      case EndGradientPosition.unknown:
        return Alignment.bottomCenter;
      case null:
        return Alignment.bottomCenter;
    }
  }

  static EdgeInsetsGeometry? _fromEdgeInsetsGeometryModel(
      EdgeInsetsGeometryModel? eigm) {
    if (eigm == null) return null;
    return EdgeInsets.only(
      left: eigm.left ?? 0,
      right: eigm.right ?? 0,
      top: eigm.top ?? 0,
      bottom: eigm.bottom ?? 0,
    );
  }

  static EdgeInsetsGeometry? determinePadding(
    AppModel app,
    MemberModel? member,
    BackgroundModel? bdm,
  ) {
    if (bdm == null) return null;
    return determinePadding2(app, member, bdm.padding);
  }

  static EdgeInsetsGeometry? determinePadding2(
    AppModel app,
    MemberModel? member,
    EdgeInsetsGeometryModel? padding,
  ) {
    if (padding == null) return null;
    return _fromEdgeInsetsGeometryModel(padding);
  }

  static EdgeInsetsGeometry? determineMargin(
    AppModel app,
    MemberModel? member,
    BackgroundModel? bdm,
  ) {
    if (bdm == null) return null;
    return _fromEdgeInsetsGeometryModel(bdm.margin);
  }

  static Clip determineClipBehaviour(
    AppModel app,
    MemberModel? member,
    BackgroundModel? bdm,
  ) {
//    return Clip.none;
    return (bdm == null) ? Clip.none : Clip.hardEdge;
  }

  static BoxDecoration? boxDecoration(
      AppModel app, MemberModel? member, BackgroundModel? bdm,
      {DecorationImage? overridingImage}) {
    if (bdm == null) {
      if (overridingImage == null) {
        return null;
      } else {
        return BoxDecoration(
          image: overridingImage,
        );
      }
    }
    BorderRadius? borderRadius;
    if (bdm.borderRadius != null) {
      if (bdm.borderRadius!.borderRadiusType == BorderRadiusType.circular) {
        borderRadius = BorderRadius.all(
            Radius.circular(bdm.borderRadius!.circularValue ?? 0));
      } else {
        borderRadius = BorderRadius.all(Radius.elliptical(
          bdm.borderRadius!.ellipticalX ?? 0,
          bdm.borderRadius!.ellipticalY ?? 0,
        ));
      }
    }
    var border = bdm.border != null && bdm.border! ? Border.all() : null;
    DecorationImage? image;
    if (overridingImage == null) {
      if ((bdm.useProfilePhotoAsBackground != null) &&
          bdm.useProfilePhotoAsBackground!) {
        if (member != null) {
          var url = member.photoURL;
          if ((url == null) && (app.anonymousProfilePhoto != null)) {
            url = app.anonymousProfilePhoto!.url;
          }
          if (url != null) {
            image = DecorationImage(
                image: NetworkImage(url), fit: BoxFit.scaleDown);
          } else {
            image = DecorationImage(
                image: AssetImage("assets/images/avatar.png",
                    package: "eliud_core"));
          }
        } else {
          image = DecorationImage(
              image: AssetImage("assets/images/avatar.png",
                  package: "eliud_core"));
        }
      }
      if (image == null) {
        var imageProvider = ((bdm.backgroundImage != null) &&
                (bdm.backgroundImage!.url != null))
            ? NetworkImage(bdm.backgroundImage!.url!)
            : null;
        image = (imageProvider != null)
            ? DecorationImage(image: imageProvider, fit: BoxFit.scaleDown)
            : null;
      }
    } else {
      image = overridingImage;
    }
    List<BoxShadow>? boxShadows;
    if (bdm.shadow != null) {
      boxShadows = [
        BoxShadow(
          color: RgbHelper.color(rgbo: bdm.shadow!.color),
          spreadRadius: bdm.shadow!.spreadRadius ?? 7,
          blurRadius: bdm.shadow!.blurRadius ?? 7,
          offset: Offset(bdm.shadow!.offsetDX ?? 5, bdm.shadow!.offsetDY ?? 5),
        )
      ];
    }
    if ((bdm.decorationColors == null) || (bdm.decorationColors!.isEmpty)) {
      return BoxDecoration(
        color: Colors.white,
        image: image,
        border: border,
        boxShadow: boxShadows,
        borderRadius: borderRadius,
      );
    } else if (bdm.decorationColors!.length == 1) {
      return BoxDecoration(
        color: RgbHelper.color(rgbo: bdm.decorationColors![0].color),
        border: border,
        image: image,
        boxShadow: boxShadows,
        borderRadius: borderRadius,
      );
    } else {
      var colors = bdm.decorationColors!
          .map((color) => RgbHelper.color(rgbo: color.color))
          .toList();
      var stops = bdm.decorationColors!.map((stop) => stop.stop ?? 0).toList();
      var noStops = stops.where((stop) => (stop < 0)).isNotEmpty;
      var gradient = LinearGradient(
          begin: startAlignment(bdm.beginGradientPosition),
          end: endAlignment(bdm.endGradientPosition),
          colors: colors,
          stops: noStops ? null : stops);

      return BoxDecoration(
        gradient: gradient,
        image: image,
        border: border,
        boxShadow: boxShadows,
        borderRadius: borderRadius,
      );
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

  static Widget getImageFromPlatformModel(
      {PlatformMediumModel? platformMediumModel,
      double? height,
      double? width,
      BoxFit? fit,
      Alignment? alignment}) {
    if (platformMediumModel == null) {
      return Image(
        image: AssetImage('assets/images/image_not_available.png'),
        height: height,
        width: width,
        alignment: alignment!,
      );
    } else {
      return getImageFromURL(
          url: platformMediumModel.url!, height: height, width: width);
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

  static Widget getThumbnailFromPlatformMediumModel(
      {PlatformMediumModel? platformMediumModel,
      double? height,
      double? width,
      BoxFit? fit,
      Alignment? alignment}) {
    if (platformMediumModel == null) {
      return Image(
          image: AssetImage('assets/images/image_not_available.png'),
          height: height,
          width: width);
    } else {
      return getImageFromURL(
          url: platformMediumModel.url!, height: height, width: width);
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
    if (iconModel == null) {
      return Icon(Icons.touch_app, color: color, semanticLabel: semanticLabel);
    }
    if (iconModel.fontFamily == null) {
      return Icon(IconData(iconModel.codePoint!, fontFamily: 'MaterialIcons'),
          color: color, semanticLabel: semanticLabel);
    }
    return Icon(
        IconData(iconModel.codePoint!, fontFamily: iconModel.fontFamily),
        color: color,
        semanticLabel: semanticLabel);
  }

  static Icon getIcon(
      {required IconData iconData, Color? color, String? semanticLabel}) {
    return Icon(iconData, color: color, semanticLabel: semanticLabel);
  }
}

class BoxFitHelper {
  static BoxFit? toBoxFit(PosSizeModel? posSizeModel, Orientation orientation) {
    if (posSizeModel == null) return null;
    if (orientation == Orientation.landscape) {
      switch (posSizeModel.fitLandscape) {
        case LandscapeFitType.landscapeFitWidth:
          return BoxFit.fitWidth;
        case LandscapeFitType.landscapeFitHeight:
          return BoxFit.fitHeight;
        case LandscapeFitType.landscapeFill:
          return BoxFit.fill;
        case LandscapeFitType.landscapeNone:
          return BoxFit.none;
        case LandscapeFitType.landscapeContain:
          return BoxFit.contain;
        case LandscapeFitType.landscapeCover:
          return BoxFit.cover;
        case LandscapeFitType.landscapeScaleDown:
          return BoxFit.scaleDown;
        case LandscapeFitType.unknown:
          return null;
        case null:
          return null;
      }
    } else {
      switch (posSizeModel.fitPortrait) {
        case PortraitFitType.portraitFitWidth:
          return BoxFit.fitWidth;
        case PortraitFitType.portraitFitHeight:
          return BoxFit.fitHeight;
        case PortraitFitType.portraitFill:
          return BoxFit.fill;
        case PortraitFitType.portraitNone:
          return BoxFit.none;
        case PortraitFitType.portraitContain:
          return BoxFit.contain;
        case PortraitFitType.portraitCover:
          return BoxFit.cover;
        case PortraitFitType.portraitScaleDown:
          return BoxFit.scaleDown;
        case PortraitFitType.unknown:
          return null;
        case null:
          return null;
      }
    }
    return null;
  }

  static double? toWidth(PosSizeModel? posSizeModel, BuildContext context,
      Orientation orientation) {
    if (posSizeModel == null) return null;
    if (orientation == Orientation.landscape) {
      if (posSizeModel.widthLandscape == 0) return null;
      if (posSizeModel.widthLandscape == null) return null;
      if (posSizeModel.widthTypeLandscape == WidthTypeLandscape.absoluteWidth) {
        return posSizeModel.widthLandscape;
      }
      return fullScreenWidth(context) * posSizeModel.widthLandscape!;
    } else {
      if (posSizeModel.widthPortrait == 0) return null;
      if (posSizeModel.widthPortrait == null) return null;
      if (posSizeModel.widthTypePortrait == WidthTypePortrait.absoluteWidth) {
        return posSizeModel.widthPortrait;
      }
      return fullScreenWidth(context) * posSizeModel.widthPortrait!;
    }
  }

  static double? toHeight(PosSizeModel? posSizeModel, BuildContext context,
      Orientation orientation) {
    if (posSizeModel == null) return null;
    if (orientation == Orientation.landscape) {
      if (posSizeModel.heightLandscape == null) return null;
      if (posSizeModel.heightLandscape == 0) return null;
      if (posSizeModel.heightTypeLandscape ==
          HeightTypeLandscape.absoluteHeight) {
        return posSizeModel.heightLandscape;
      }
      return fullScreenHeight(context) * posSizeModel.heightLandscape!;
    } else {
      if (posSizeModel.heightPortrait == 0) return null;
      if (posSizeModel.heightPortrait == null) return null;
      if (posSizeModel.heightTypePortrait ==
          HeightTypePortrait.absoluteHeight) {
        return posSizeModel.heightPortrait;
      }
      return fullScreenHeight(context) * posSizeModel.heightPortrait!;
    }
  }

  static Alignment? toAlignment(
      PosSizeModel? posSizeModel, Orientation orientation) {
    if (posSizeModel == null) return null;
    if (orientation == Orientation.landscape) {
      switch (posSizeModel.alignTypeLandscape) {
        case LandscapeAlignType.landscapeAlignTopLeft:
          return Alignment.topLeft;
        case LandscapeAlignType.landscapeAlignTopCenter:
          return Alignment.topCenter;
        case LandscapeAlignType.landscapeAlignTopRight:
          return Alignment.topRight;
        case LandscapeAlignType.landscapeAlignCenterLeft:
          return Alignment.centerRight;
        case LandscapeAlignType.landscapeAlignCenter:
          return Alignment.center;
        case LandscapeAlignType.landscapeAlignCenterRight:
          return Alignment.centerRight;
        case LandscapeAlignType.landscapeAlignBottomLeft:
          return Alignment.bottomLeft;
        case LandscapeAlignType.landscapeAlignBottomCenter:
          return Alignment.bottomCenter;
        case LandscapeAlignType.landscapeAlignBottomRight:
          return Alignment.bottomRight;
        case LandscapeAlignType.unknown:
          return Alignment.bottomRight;
        case null:
          return null;
      }
    } else {
      switch (posSizeModel.alignTypePortrait) {
        case PortraitAlignType.portraitAlignTopLeft:
          return Alignment.topLeft;
        case PortraitAlignType.portraitAlignTopCenter:
          return Alignment.topCenter;
        case PortraitAlignType.portraitAlignTopRight:
          return Alignment.topRight;
        case PortraitAlignType.portraitAlignCenterLeft:
          return Alignment.centerRight;
        case PortraitAlignType.portraitAlignCenter:
          return Alignment.center;
        case PortraitAlignType.portraitAlignCenterRight:
          return Alignment.centerRight;
        case PortraitAlignType.portraitAlignBottomLeft:
          return Alignment.bottomLeft;
        case PortraitAlignType.portraitAlignBottomCenter:
          return Alignment.bottomCenter;
        case PortraitAlignType.portraitAlignBottomRight:
          return Alignment.bottomRight;
        case PortraitAlignType.unknown:
          return Alignment.bottomRight;
        case null:
          return null;
      }
    }
    return null;
  }
}

abstract class ListTool<T> {
  static List<T> copyAllExcept<T>(
      List<T> original, bool Function(T t) exclude) {
    var newList = <T>[];
    for (var element in original) {
      if (!exclude(element)) newList.add(element);
    }
    return newList;
  }

  static List<T> addAllExcept<T>(
      List<T> original, List<T> addHere, bool Function(T t) exclude) {
    for (var element in original) {
      if (!exclude(element)) addHere.add(element);
    }
    return addHere;
  }
}
