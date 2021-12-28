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
      "fieldName": "homePageBlockedMember",
      "remark": "Entry page for blocked member",
      "displayName": "Entry Page",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "homePagePublic",
      "remark": "Entry page for public",
      "displayName": "Entry Page Public",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "homePageSubscribedMember",
      "remark": "Entry page for subscribed member, i.e. for a person logged in but without privileges",
      "displayName": "Entry Page Member",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "homePageLevel1Member",
      "remark": "Entry page for level 1 privileged member",
      "displayName": "Level 1 Member Home",
      "fieldType": "String",
      "group": "homePageLevel1Member"
    },
    {
      "fieldName": "homePageLevel2Member",
      "remark": "Entry page for level 2 privileged member",
      "displayName": "Level 2 Member Home",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "homePageOwner",
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
    "title": "value.text != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.text!)) : Container()",
    "subTitle": "value.description != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.description!)) : Container()"
  }
}