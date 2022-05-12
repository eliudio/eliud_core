{
  "id": "DecorationColor",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "color",
      "displayName": "Color",
      "defaultValue": "RgbModel(r: 64, g: 6, b: 64, opacity: 1.00)",
      "fieldType": "Rgb",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(widget.app, \"Background Color\", state.value!.color, _onColorChanged)"
    },
    {
      "fieldName": "stop",
      "displayName": "Stop (-1 = no stop)",
      "defaultValue": "0.1",
      "fieldType": "double",
      "iconName": "color_lens"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()"
  }
}