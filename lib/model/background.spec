{
  "id": "Background",
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
      "fieldName": "backgroundImage",
      "remark": "Background Image. If you want to use an image you've uploaded to your member area then please use that public URL",
      "displayName": "Header Background Image",
      "fieldType": "PublicMedium",
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
      "association": false,
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
      "fieldName": "borderRadius",
      "fieldType": "BorderRadius",
      "association": false,
      "optional": true
    },
    {
      "fieldName": "border",
      "fieldType": "bool",
      "group": "general"
    },
    {
      "fieldName": "padding",
      "fieldType": "EdgeInsetsGeometry",
      "group": "general"
    },
    {
      "fieldName": "margin",
      "fieldType": "EdgeInsetsGeometry",
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
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID)) : Container()"
  }
}