{
  "id": "MemberSubscription",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "generateFirestoreRepository": false,
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
      "fieldName": "app",
      "displayName": "App",
      "fieldType": "App",
      "association": true,
      "optional": false,
      "group": "app"
    }
  ],
  "groups": [
    {
        "group": "app",
        "description": "App"
    }
  ],
  "listFields": {
    "title": "app.documentID",
    "title": "app.title"
  }
}