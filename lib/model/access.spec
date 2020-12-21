{
  "id": "Access",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
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
    "isDocumentCollection": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "remark": "This is the member ID",
      "fieldType": "String",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "isMember",
      "displayName": "Is this a member?",
      "remark": "Is this a member? A member with accesslevel isMember can have isPrivilegedMember set",
      "fieldType": "bool"
    },
    {
      "fieldName": "isPrivilegedMember",
      "displayName": "Is this a privileged member?",
      "remark": "Is this a privileged member? A member with accesslevel isPrivilegedMember must (!) have isMember set. We could have made this a membership level enum field which would have values member, privileged mmeber, pending member, blocked member. However we have these values for the rules to work!",
      "fieldType": "bool"
    },
    {
      "fieldName": "isMembershipPending",
      "displayName": "Is membership pending?",
      "remark": "Is this a member? A member with accesslevel isMembershipPending must have isMember set to false",
      "fieldType": "bool"
    },
    {
      "fieldName": "isBlocked",
      "displayName": "Is this member blocked?",
      "fieldType": "bool"
    },
    {
      "fieldName": "points",
      "displayName": "Points",
      "remark": "Points received for this app. Points accrued can result in increase of privilege",
      "fieldType": "int"
    }
  ]
}