{
  "id": "AppBar",
  "packageName": "eliud_core",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
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
      "fieldName": "title",
      "displayName": "Title",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "header",
      "displayName": "Header",
      "fieldType": "enum",
      "remark": "Enum indicating which header to use, and hence which field to use: title, icon or image",
      "enumName": "HeaderSelection",
      "enumValues" : [ "Title", "Image", "Icon", "None" ],
      "group": "header"
    },
    {
      "fieldName": "icon",
      "displayName": "Icon",
      "fieldType": "Icon",
      "group": "icon",
      "bespokeFormField": "IconField"
    },
    {
      "fieldName": "image",
      "displayName": "Image",
      "fieldType": "Image",
      "association": true,
      "optional": true,
      "group": "Image"
    },
    {
      "fieldName": "iconMenu",
      "displayName": "Icon Menu",
      "fieldType": "MenuDef",
      "association": true,
      "optional": true,
      "group": "iconMenu"
    },
    {
      "fieldName": "background",
      "displayName": "background",
      "fieldType": "Background",
      "association": true,
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "iconColor",
      "displayName": "Icon Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "iconColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Text color\", state.value.iconColor, _onIconColorChanged)"
    },
    {
      "fieldName": "selectedIconColor",
      "displayName": "Selected Icon Color",
      "fieldType": "Rgb",
      "group": "iconColors",
      "iconName": "color_lens",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "bespokeFormField": "RgbField(\"Selected Icon Color\", state.value.selectedIconColor, _onSelectedIconColorChanged)"
    },
    {
      "fieldName": "menuBackgroundColor",
      "displayName": "Background Color",
      "defaultValue": "RgbModel(r: 64, g: 6, b: 64, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "menuColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Background Color\", state.value.menuBackgroundColor, _onMenuBackgroundColorChanged)"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "header",
        "description": "Header type"
    },
    {
        "group": "Image",
        "description": "Image"
    },
    {
        "group": "icon",
        "description": "Icon"
    },
    {
        "group": "iconMenu",
        "description": "Icon Menu"
    },
    {
        "group": "colors",
        "description": "AppBar Colors"
    },
    {
        "group": "iconColors",
        "description": "Icon Colors"
    },
    {
        "group": "menuColors",
        "description": "Menu Colors"
    },
    {
        "group": "background",
        "description": "Header Background"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "title"
  }
}