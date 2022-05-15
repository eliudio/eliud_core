{
  "id": "EdgeInsetsGeometry",
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
      "fieldName": "left",
      "displayName": "Left",
      "fieldType": "double"
    },
    {
      "fieldName": "right",
      "displayName": "Right",
      "fieldType": "double"
    },
    {
      "fieldName": "top",
      "displayName": "Top",
      "fieldType": "double"
    },
    {
      "fieldName": "bottom",
      "displayName": "Bottom",
      "fieldType": "double"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()",
    "subTitle": "value.comments != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.comments!)) : Container()"
  }
}