{
  "id": "Font",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": true,
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
      "fieldName": "fontName",
      "displayName": "Font Family Name (currently supported family is Google Fonts)",
      "remark": "See https://fonts.google.com/",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "size",
      "displayName": "Size",
      "fieldType": "double",
      "iconName": "text_format",
      "defaultValue": "20",
      "group": "general"
    },
    {
      "fieldName": "weight",
      "displayName": "Weight",
      "fieldType": "enum",
      "enumName": "EliudFontWeight",
      "enumValues" : [ "Thin", "ExtraLight", "Light", "Normal", "Medium", "SemiBold", "Bold", "ExtraBold", "MostThick" ],
      "group": "weight"
    },
    {
      "fieldName": "style",
      "displayName": "Style",
      "fieldType": "enum",
      "enumName": "EliudFontStyle",
      "enumValues" : [ "Italic", "Normal" ],
      "group": "style"
    },
    {
      "fieldName": "decoration",
      "displayName": "Decoration",
      "fieldType": "enum",
      "enumName": "EliudFontDecoration",
      "enumValues" : [ "None", "Underline", "Overline", "LineThrough" ],
      "group": "decoration"
    },
    {
      "fieldName": "color",
      "displayName": "Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "fontColor",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Font Color\", state.value!.color, _onColorChanged)"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "weight",
        "description": "Weight"
    },
    {
        "group": "style",
        "description": "Style"
    },
    {
        "group": "decoration",
        "description": "Decoration"
    },
    {
        "group": "fontColor",
        "description": "Font Color"
    }
  ],
  "listFields": {
    "title": "value!.fontName != null ? Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value!.fontName!)) : Container()"
  }
}