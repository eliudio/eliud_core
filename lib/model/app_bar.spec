{
  "id": "AppBar",
  "packageName": "eliud_core",
  "isAppModel": true,
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
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
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
      "fieldType": "MemberMedium",
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
      "fieldName": "backgroundOverride",
      "displayName": "Background Override",
      "fieldType": "Background",
      "association": true,
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "iconColorOverride",
      "displayName": "Icon Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "iconColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(widget.app, \"Text color\", state.value!.iconColorOverride, _onIconColorOverrideChanged)"
    },
    {
      "fieldName": "selectedIconColorOverride",
      "displayName": "Selected Icon Color",
      "fieldType": "Rgb",
      "group": "iconColors",
      "iconName": "color_lens",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "bespokeFormField": "RgbField(widget.app, \"Selected Icon Color\", state.value!.selectedIconColorOverride, _onSelectedIconColorOverrideChanged)"
    },
    {
      "fieldName": "menuBackgroundColorOverride",
      "displayName": "Background Color",
      "defaultValue": "RgbModel(r: 64, g: 6, b: 64, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "menuColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(widget.app, \"Background Color\", state.value!.menuBackgroundColorOverride, _onMenuBackgroundColorOverrideChanged)"
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
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()",
    "subTitle": "value.title != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.title!)) : Container()"
  }
}