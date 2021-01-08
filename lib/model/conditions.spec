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
      "fieldName": "readCondition",
      "displayName": "Read condition",
      "remark": "Page only accessible conditionally. A page (or dialog, or menu item, or ...) has a ReadCondition. This can be one of the ReadCondition enum values. \n
      Values: NonRestricted, MustNotBeLoggedIn, PackageDecides or MemberOrPrivilegedMemberOnly. If a ReadCondition is PackageDecides, then the field packageCondition is used as label to query the packages for the condition.
      When readCondition is set to MemberOrPrivilegedMemberOnly, then privilegeLevelRequired is compared against the priveligeLevel of the member (in app/access/{user id}/privilegeLevel)
      If a member is blocked, meaning his app/access/{user id}/privilegeLevel is set to BLOCKED_MEMBERSHIP, then that member can still see the pages which have NoRestriction, MustNotBeLoggedIn or PackageDecides
      because those pages are actually visible publically. As a matter of fact a blocked user could choose to access the app without logging in and see those.
      
      ",
      "fieldType": "bespoke",
      "bespokeFieldType": "ReadCondition",
      "bespokeEntityMapping": "toReadCondition(map['readCondition'])",
      "bespokeEntityToDocument" : "    if (readCondition != null) theDocument['readCondition'] = readCondition.index; else theDocument['readCondition'] = null;",
      "group": "conditional"
    },
    {
      "fieldName": "privilegeLevelRequired",
      "displayName": "Privilege Level Required",
      "fieldType": "int",
      "defaultValue": "0",
      "conditional": "(state.value.privilegeLevelRequired == ReadCondition.MemberOrPrivilegedMemberOnly)",
      "group": "conditional"
    },
    {
      "fieldName": "packageCondition",
      "displayName": "Package condition",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "(state.value.packageCondition == ReadCondition.PackageDecides)",
      "group": "conditional2"
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
        "conditional": "(state.value.packageCondition == ReadCondition.PackageDecides)"
    }
  ]
}