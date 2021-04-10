{
  "id": "Conditions",
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
    "generateEmbeddedComponent": false,
    "isDocumentCollection": false
  },
  "fields": [
    {
      "fieldName": "privilegeLevelRequired",
      "displayName": "Privilege Level Required",
      "remark": "see firestore rules",
      "fieldType": "enum",
      "enumName": "PrivilegeLevelRequired",
      "enumValues" : [ "NoPrivilegeRequired", "Level1PrivilegeRequired", "Level2PrivilegeRequired", "OwnerPrivilegeRequired" ],
      "defaultValue": "0",
      "group": "conditional"
    },
    {
      "fieldName": "packageCondition",
      "displayName": "Package condition",
      "remark": "see firestore rules",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "(state.value!.packageCondition == ReadCondition.PackageDecides)",
      "group": "conditional2"
    },
    {
      "fieldName": "conditionOverride",
      "displayName": "Condition override",
      "remark": "see firestore rules",
      "fieldType": "enum",
      "enumName": "ConditionOverride",
      "enumValues" : [ "ExactPrivilege", "InclusiveForBlockedMembers", "ExclusiveForBlockedMember" ],
      "group": "conditional3"
    }
  ],
  "groups": [
    {
        "group": "conditional",
        "description": "Conditional"
    },
    {
        "group": "conditional2",
        "description": "Plugin Condition",
        "conditional": "(state.value!.packageCondition == ReadCondition.PackageDecides)"
    },
    {
        "group": "conditional3",
        "description": "Conditional"
    }
  ]
}