{
  "id": "StorageConditions",
  "packageName": "eliud_core",
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
      "enumValues" : [ "NoPrivilegeRequiredSimple", "Level1PrivilegeRequiredSimple", "Level2PrivilegeRequiredSimple", "OwnerPrivilegeRequiredSimple" ],
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