{
  "id": "PosSize",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "generate": {
    "generateComponent": false,
    "generateRepository": false,
    "generateCache": false,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "widthPortrait",
      "fieldType": "double",
      "group": "widthPortrait",
      "optional": true
    },
    {
      "fieldName": "widthTypePortrait",
      "displayName": "Width Absolute or Percentage",
      "remark": "Is width an absolute value or a percentage of the device width?",
      "fieldType": "enum",
      "enumName": "WidthTypePortrait",
      "enumValues" : [ "absoluteWidth", "percentageWidth" ],
      "group": "widthTypePortrait"
    },
    {
      "fieldName": "widthLandscape",
      "fieldType": "double",
      "group": "widthLandscape",
      "optional": true
    },
    {
      "fieldName": "widthTypeLandscape",
      "displayName": "Width Absolute or Percentage when Landscape mode",
      "remark": "Is width an absolute value or a percentage of the device width?",
      "fieldType": "enum",
      "enumName": "WidthTypeLandscape",
      "enumValues" : [ "absoluteWidth", "percentageWidth" ],
      "group": "widthTypeLandscape"
    },
    {
      "fieldName": "heightPortrait",
      "fieldType": "double",
      "group": "heightPortrait",
      "optional": true
    },
    {
      "fieldName": "heightTypePortrait",
      "displayName": "Height Absolute or Percentage",
      "remark": "Is height an absolute value or a percentage of the device height?",
      "fieldType": "enum",
      "enumName": "HeightTypePortrait",
      "enumValues" : [ "absoluteHeight", "percentageHeight" ],
      "group": "heightTypePortrait"
    },
    {
      "fieldName": "heightLandscape",
      "fieldType": "double",
      "group": "heightLandscape",
      "optional": true
    },
    {
      "fieldName": "heightTypeLandscape",
      "displayName": "Height Absolute or Percentage when Landscape mode",
      "remark": "Is height an absolute value or a percentage of the device height?",
      "fieldType": "enum",
      "enumName": "HeightTypeLandscape",
      "enumValues" : [ "absoluteHeight", "percentageHeight" ],
      "group": "heightTypeLandscape"
    },
    {
      "fieldName": "fitPortrait",
      "displayName": "Box Fit Portrait",
      "remark": "How to fit the item within the box, when portrait",
      "fieldType": "enum",
      "enumName": "PortraitFitType",
      "enumValues" : [ "portraitFitWidth", "portraitFitHeight" , "portraitFill", "portraitNone", "portraitContain", "portraitCover", "portraitScaleDown" ],
      "group": "fitPortrait"
    },
    {
      "fieldName": "fitLandscape",
      "displayName": "Box Fit Landscape",
      "remark": "How to fit the item within the box, when landscape",
      "fieldType": "enum",
      "enumName": "LandscapeFitType",
      "enumValues" : [ "landscapeFitWidth", "landscapeFitHeight", "landscapeFill", "landscapeNone", "landscapeContain", "landscapeCover", "landscapeScaleDown" ],
      "group": "fitLandscape"
    },
    {
      "fieldName": "alignTypePortrait",
      "displayName": "Align type Portrait",
      "remark": "Align when Portrait",
      "fieldType": "enum",
      "enumName": "PortraitAlignType",
      "enumValues" : [ "portraitAlignTopLeft", "portraitAlignTopCenter", "portraitAlignTopRight", "portraitAlignCenterLeft", "portraitAlignCenter", "portraitAlignCenterRight", "portraitAlignBottomLeft", "portraitAlignBottomCenter", "portraitAlignBottomRight" ],
      "group": "alignPortrait"
    },
    {
      "fieldName": "alignTypeLandscape",
      "displayName": "Align type Landscape",
      "remark": "Align when Landscape",
      "fieldType": "enum",
      "enumName": "LandscapeAlignType",
      "enumValues" : [ "landscapeAlignTopLeft", "landscapeAlignTopCenter", "landscapeAlignTopRight", "landscapeAlignCenterLeft", "landscapeAlignCenter", "landscapeAlignCenterRight", "landscapeAlignBottomLeft", "landscapeAlignBottomCenter", "landscapeAlignBottomRight" ],
      "group": "alignLandscape"
    },
    {
      "fieldName": "clip",
      "displayName": "Clip",
      "remark": "Clip",
      "fieldType": "enum",
      "enumName": "ClipType",
      "enumValues" : [ "noClip", "clipOval", "clipRRect5", "clipRRect10", "clipRRect15", "clipRRect20", "clipRRect30", "clipRRect40" ],
      "group": "clip"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "clip",
        "description": "Clip"
    },
    {
        "group": "widthHeight",
        "description": "Width and Height"
    },
    {
        "group": "widthLandscape",
        "description": "Width when Landscape"
    },
    {
        "group": "widthPortrait",
        "description": "Width when Portrait"
    },
    {
        "group": "widthTypeLandscape",
        "description": "Width type when Landscape"
    },
    {
        "group": "widthTypePortrait",
        "description": "Width type when Portrait"
    },
    {
        "group": "heightLandscape",
        "description": "Height when Landscape"
    },
    {
        "group": "heightPortrait",
        "description": "Height when Portrait"
    },
    {
        "group": "heightTypeLandscape",
        "description": "Height type when Landscape"
    },
    {
        "group": "heightTypePortrait",
        "description": "Height type when Portrait"
    },
    {
        "group": "fitLandscape",
        "description": "Box Fit when Landscape"
    },
    {
        "group": "fitPortrait",
        "description": "Box Fit when Portrait"
    },
    {
        "group": "alignLandscape",
        "description": "Align when Landscape"
    },
    {
        "group": "alignPortrait",
        "description": "Align when Portrait"
    }
  ],
  "listFields": {
    "title": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))",
    "subTitle": "value.name != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.name!)) : Container()"
  }
}
