{
  "id": "App",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
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
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "ownerID",
      "displayName": "Owner ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general",
      "hidden": true
    },
    {
      "fieldName": "title",
      "displayName": "Title",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "email",
      "displayName": "Contact email",
      "fieldType": "String",
      "iconName": "email",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "appStatus",
      "displayName": "Status of your application",
      "fieldType": "enum",
      "enumName": "AppStatus",
      "enumValues" : [ "Live", "Offline", "Invisible" ],
      "group": "appStatus"
    },
    {
      "fieldName": "anonymousProfilePhoto",
      "displayName": "Profile photo to display when member has none",
      "association": true,
      "fieldType": "PublicMedium"
    },
    {
      "fieldName": "homePages",
      "fieldType": "AppHomePageReferences",
      "association": false,
      "optional": true,
      "group": "homePages"
    },
    {
      "fieldName": "logo",
      "fieldType": "PublicMedium",
      "association": true,
      "optional": true,
      "iconName": "add_a_photo",
      "group": "logo"
    },
    {
      "fieldName": "policies",
      "displayName": "Policy",
      "fieldType": "AppPolicy",
      "association": true,
      "optional": true,
      "group": "policy"
    },
    {
      "fieldName": "styleFamily",
      "displayName": "Style Family",
      "fieldType": "String"
    },
    {
      "fieldName": "styleName",
      "displayName": "Style Name",
      "fieldType": "String"
    },
    {
      "fieldName": "autoPrivileged1",
      "remark": "When set, any new joining member will have privilegeLevel = 1",
      "fieldType": "bool"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "style",
        "description": "Style"
    },
    {
        "group": "policy",
        "description": "Policy"
    },
    {
        "group": "owner",
        "description": "Owner"
    },
    {
        "group": "homePages",
        "description": "Home Pages"
    },
    {
        "group": "logo",
        "description": "Logo"
    },
    {
        "group": "route",
        "description": "Page Route Builder"
    },
    {
        "group": "appStatus",
        "description": "Status of the application"
    },
    {
        "group": "style",
        "description": "Style"
    }
  ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()",
    "subTitle": "value.title != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.title!)) : Container()"
  }
}