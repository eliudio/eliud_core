{
  "id": "StorageConditions",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "isAppModel": true,
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
      "fieldName": "privilegeLevelRequired",
      "displayName": "Privilege Level Required",
      "remark": "see firestore rules",
      "fieldType": "enum",
      "enumName": "PrivilegeLevelRequiredSimple",
      "enumValues" : [ "noPrivilegeRequiredSimple", "level1PrivilegeRequiredSimple", "level2PrivilegeRequiredSimple", "ownerPrivilegeRequiredSimple" ],
      "defaultValue": "0",
      "group": "conditional"
    }
  ],
  "groups": [
    {
        "group": "conditional",
        "description": "Conditional"
    }
  ]
}