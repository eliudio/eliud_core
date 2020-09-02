{
  "id": "PosSize",
  "packageName": "eliud_core",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "name",
      "displayName": "Name",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
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
      "enumValues" : [ "AbsoluteWidth", "PercentageWidth" ],
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
      "enumValues" : [ "AbsoluteWidth", "PercentageWidth" ],
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
      "enumValues" : [ "AbsoluteHeight", "PercentageHeight" ],
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
      "enumValues" : [ "AbsoluteHeight", "PercentageHeight" ],
      "group": "heightTypeLandscape"
    },
    {
      "fieldName": "fitPortrait",
      "displayName": "Box Fit Portrait",
      "remark": "How to fit the item within the box, when portrait",
      "fieldType": "enum",
      "enumName": "PortraitFitType",
      "enumValues" : [ "PortraitFitWidth", "PortraitFitHeight" , "PortraitFill", "PortraitNone", "PortraitContain", "PortraitCover", "PortraitScaleDown" ],
      "group": "fitPortrait"
    },
    {
      "fieldName": "fitLandscape",
      "displayName": "Box Fit Landscape",
      "remark": "How to fit the item within the box, when landscape",
      "fieldType": "enum",
      "enumName": "LandscapeFitType",
      "enumValues" : [ "LandscapeFitWidth", "LandscapeFitHeight" , "LandscapeFill", "LandscapeNone", "LandscapeContain", "LandscapeCover", "LandscapeScaleDown" ],
      "group": "fitLandscape"
    },
    {
      "fieldName": "alignTypePortrait",
      "displayName": "Align type Portrait",
      "remark": "Align when Portrait",
      "fieldType": "enum",
      "enumName": "PortraitAlignType",
      "enumValues" : [ "PortraitAlignTopLeft", "PortraitAlignTopCenter", "PortraitAlignTopRight", "PortraitAlignCenterLeft", "PortraitAlignCenter", "PortraitAlignCenterRight", "PortraitAlignBottomLeft", "PortraitAlignBottomCenter", "PortraitAlignBottomRight" ],
      "group": "alignPortrait"
    },
    {
      "fieldName": "alignTypeLandscape",
      "displayName": "Align type Landscape",
      "remark": "Align when Landscape",
      "fieldType": "enum",
      "enumName": "LandscapeAlignType",
      "enumValues" : [ "LandscapeAlignTopLeft", "LandscapeAlignTopCenter", "LandscapeAlignTopRight", "LandscapeAlignCenterLeft", "LandscapeAlignCenter", "LandscapeAlignCenterRight", "LandscapeAlignBottomLeft", "LandscapeAlignBottomCenter", "LandscapeAlignBottomRight" ],
      "group": "alignLandscape"
    },
    {
      "fieldName": "clip",
      "displayName": "Clip",
      "remark": "Clip",
      "fieldType": "enum",
      "enumName": "ClipType",
      "enumValues" : [ "NoClip", "ClipOval", "ClipRRect5", "ClipRRect10", "ClipRRect15", "ClipRRect20", "ClipRRect30", "ClipRRect40" ],
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
    "title": "documentID",
    "subTitle": "name"
  }
}
