{
  "id": "Background",
  "packageName": "eliud_core",
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
      "fieldName": "comments",
      "displayName": "Comments",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "backgroundImageURL",
      "remark": "Background Image. If you want to use an image you've uploaded to your member area then please use that public URL",
      "displayName": "Header Background Image",
      "fieldType": "String",
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
    "title": "documentID!",
    "subTitle": "comments!"
  }
}