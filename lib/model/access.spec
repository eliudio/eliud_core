{
  "id": "Access",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": false,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false,
    "documentSubCollectionOf": "app"
  },
  "memberIdentifier": "documentID",
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "remark": "This is the member ID",
      "fieldType": "String",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
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
      "fieldName": "privilegeLevel",
      "displayName": "Privilege Level",
      "remark": "This is the privilege level and will determine the data accessible",
      "fieldType": "enum",
      "enumName": "PrivilegeLevel",
      "enumValues" : [ "noPrivilege", "level1Privilege", "level2Privilege", "ownerPrivilege" ]
    },
    {
      "fieldName": "points",
      "displayName": "Points",
      "remark": "Points received for this app. Points accrued can result in increase of privilege",
      "fieldType": "int"
    },
    {
      "fieldName": "blocked",
      "displayName": "Is Blocked",
      "remark": "Is this user blocked",
      "fieldType": "bool"
    },
    {
      "fieldName": "privilegeLevelBeforeBlocked",
      "displayName": "Privilege Level Before Blocked",
      "remark": "This is the privilege level before the member was blocked and allows to restore to this point",
      "fieldType": "enum",
      "enumName": "PrivilegeLevelBeforeBlocked",
      "enumValues" : [ "noPrivilege", "level1Privilege", "level2Privilege", "ownerPrivilege" ]
    }
  ]
}