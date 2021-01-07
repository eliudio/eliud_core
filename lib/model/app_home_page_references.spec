{
  "id": "AppHomePageReferences",
  "packageName": "eliud_core",
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
      "fieldName": "homePageBlockedMemberId",
      "remark": "Entry page for blocked member",
      "displayName": "Entry Page",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "homePageSubscribedMemberId",
      "remark": "Entry page for subscribed member",
      "displayName": "Entry Page",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "homePageLevel1MemberId",
      "remark": "Entry page for level 1 privileged member",
      "displayName": "Entry Page",
      "fieldType": "String",
      "group": "homePageLevel1Member"
    },
    {
      "fieldName": "homePageLevel2MemberId",
      "remark": "Entry page for level 2 privileged member",
      "displayName": "Entry Page",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "homePageOwnerId",
      "remark": "Entry page for the owner",
      "displayName": "Entry Page",
      "fieldType": "String",
      "group": "general"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "listFields": {
    "title": "text",
    "subTitle": "description"
  }
}