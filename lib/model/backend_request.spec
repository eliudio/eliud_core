{
  "id": "BackendRequest",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "isAppModel": true,
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
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "authorId",
      "displayName": "Author ID",
      "fieldType": "String"
    },
    {
      "fieldName": "name",
      "displayName": "Author ID",
      "fieldType": "String"
    },
    {
      "fieldName": "sendTo",
      "displayName": "sendTo email address",
      "fieldType": "String"
    },
    {
      "fieldName": "collections",
      "fieldType": "bespoke",
      "bespokeFieldType": "List<Map<String, String>>",
      "bespokeEntityMapping": "map['collections']",
      "bespokeEntityToDocument" : "    theDocument['collections'] = collections;\n"
    },
    {
      "fieldName": "processed",
      "displayName": "Processed",
      "fieldType": "bool",
      "group": "general"
    },
    {
      "fieldName": "requestType",
      "displayName": "Request type",
      "fieldType": "enum",
      "enumName": "RequestType",
      "enumValues" : [ "RequestEmailData", "DestroyAccount" ],
      "defaultValue": "RequestType.RequestEmailData"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "imageSource",
        "description": "Source"
    },
    {
        "group": "filename",
        "description": "Photo"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID)) : Container()",
    "subTitle": "value.description != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.description!)) : Container()"
  }
}
