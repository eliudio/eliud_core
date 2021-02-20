{
  "id": "Background",
  "packageName": "eliud_core",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
	"generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
    "isDocumentCollection": true
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
      "fieldName": "comments",
      "displayName": "Comments",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "backgroundImage",
      "displayName": "Header Background Image",
      "fieldType": "MemberMedium",
      "association": true,
      "optional": true,
      "group": "image"
    },
    {
      "fieldName": "useProfilePhotoAsBackground",
      "remark": "When set, the profile photo will be used as background. This takes preference over backgroundImage.",
      "displayName": "Use Profile Photo As Background",
      "fieldType": "bool"
    },
    {
      "fieldName": "beginGradientPosition",
      "displayName": "Start Gradient",
      "remark": "Start position of the gradient",
      "fieldType": "enum",
      "enumName": "StartGradientPosition",
      "enumValues" : [ "TopLeft", "TopCenter" , "TopRight", "CenterLeft", "Center", "CenterRight", "BottomLeft", "BottomCenter", "BottomRight" ],
      "group": "beginGradientPosition"
    },
    {
      "fieldName": "endGradientPosition",
      "displayName": "End Gradient",
      "remark": "End position of the gradient",
      "fieldType": "enum",
      "enumName": "EndGradientPosition",
      "enumValues" : [ "TopLeft", "TopCenter" , "TopRight", "CenterLeft", "Center", "CenterRight", "BottomLeft", "BottomCenter", "BottomRight" ],
      "group": "endGradientPosition"
    },
    {
      "fieldName": "shadow",
      "fieldType": "Shadow",
      "association": true,
      "optional": true,
      "iconName": "wb_sunny",
      "group": "shadow"
    },
    {
      "fieldName": "decorationColors",
      "fieldType": "DecorationColor",
      "arrayType": "Array",
      "group": "colors"
    },
    {
      "fieldName": "border",
      "fieldType": "bool",
      "group": "general"
    },
    {
      "fieldName": "admin",
      "hidden": true,
      "fieldType": "bool",
      "group": "general"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "colors",
        "description": "Colors"
    },
    {
        "group": "image",
        "description": "Background Image"
    },
    {
        "group": "beginGradientPosition",
        "description": "Start position of the gradient"
    },
    {
        "group": "endGradientPosition",
        "description": "End position of the gradient"
    },
    {
        "group": "shadow",
        "description": "Shadow"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "comments"
  }
}