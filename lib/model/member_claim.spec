{
  "id": "MemberClaim",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "isAppModel": false,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false
  },
  "memberIdentifier": "authorId",
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID of this read indication",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "refreshValue",
      "displayName": "Refresh Value",
      "fieldType": "int"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
 ],
  "depends": ["eliud_core"]
}