{
  "id": "MemberPublicInfo",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "isAppModel": false,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "documentID",
      "remark": "User UUID",
      "displayName": "User UUID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "name",
      "displayName": "Name",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "photoURL",
      "displayName": "Profile Photo",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general",
      "hidden": true
    },
    {
      "fieldName": "subscriptions",
      "displayName": "Subscriptions",
      "fieldType": "MemberSubscription",
      "arrayType": "Array",
      "group": "subscriptions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()",
    "subTitle": "value.name != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.name!)) : Container()"
  }
}
