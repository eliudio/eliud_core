{
  "id": "Shadow",
  "packageName": "eliud_core",
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
      "fieldName": "color",
      "displayName": "Color",
      "defaultValue": "RgbModel(r: 211, g: 211, b: 211, opacity: 0.50)",
      "fieldType": "Rgb",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(widget.app, \"Color\", state.value!.color, _onColorChanged)"
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
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()",
    "subTitle": "value.comments != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.comments!)) : Container()"
  }
}