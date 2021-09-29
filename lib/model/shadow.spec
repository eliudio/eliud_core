{
  "id": "Shadow",
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
      "fieldName": "color",
      "displayName": "Color",
      "defaultValue": "RgbModel(r: 211, g: 211, b: 211, opacity: 0.50)",
      "fieldType": "Rgb",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Color\", state.value!.color, _onColorChanged)"
    },
    {
      "fieldName": "offsetDX",
      "displayName": "DX",
      "remark": "The first argument sets [dx], the horizontal component of the offset",
      "fieldType": "double",
      "group": "offset"
    },
    {
      "fieldName": "offsetDY",
      "displayName": "DY",
      "remark": "The second argument sets [dy], the vertical component of the offset",
      "fieldType": "double",
      "group": "offset"
    },
    {
      "fieldName": "spreadRadius",
      "displayName": "Spread Radius",
      "remark": "The amount the box should be inflated prior to applying the blur.",
      "fieldType": "double",
      "group": "other"
    },
    {
      "fieldName": "blurRadius",
      "displayName": "Blur Radius",
      "remark": "The standard deviation of the Gaussian to convolve with the shadow's shape.",
      "fieldType": "double",
      "group": "other"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "offset",
        "description": "Offset"
    },
    {
        "group": "other",
        "description": "Other parameters"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.documentID!)) : Container()",
    "subTitle": "value.comments != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.comments!)) : Container()"
  }
}