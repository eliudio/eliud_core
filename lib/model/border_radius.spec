{
  "id": "BorderRadius",
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
      "fieldName": "borderRadiusType",
      "displayName": "Border Radius Type",
      "remark": "Border Radius Type",
      "fieldType": "enum",
      "enumName": "BorderRadiusType",
      "enumValues" : [ "Circular", "Elliptical" ],
      "defaultValue": "0",
      "group": "conditional"
    },
    {
      "fieldName": "circularValue",
      "displayName": "Circular Value",
      "fieldType": "double"
    },
    {
      "fieldName": "ellipticalX",
      "displayName": "Elliptical X",
      "fieldType": "double"
    },
    {
      "fieldName": "ellipticalY",
      "displayName": "Elliptical Y",
      "fieldType": "double"
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