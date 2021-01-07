{
  "id": "Access",
  "packageName": "eliud_core",
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
      "fieldName": "privilegeLevel",
      "displayName": "Privilege Level",
      "remark": "This is the privilege level and will determine the data accessible",
      "fieldType": "int"
    },
    {
      "fieldName": "points",
      "displayName": "Points",
      "remark": "Points received for this app. Points accrued can result in increase of privilege",
      "fieldType": "int"
    }
  ]
}