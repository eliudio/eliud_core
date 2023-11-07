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
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "ownerID",
      "required": true,
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
      "fieldName": "homeURL",
      "displayName": "Home URL",
      "remark": "This is usual as information, but actually used by some component, e.g. HtmlWithPlatformMediumComponent / AbstractTextPlatform: a html text including a link will evaluate the link and if it's a link within the app / website, it'll open that page.",
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
      "enumValues" : [ "live", "offline", "invisible" ],
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
    },
    {
      "fieldName": "isFeatured",
      "remark": "Is Featured",
      "fieldType": "bool"
    },
    {
      "fieldName": "includeShippingAddress",
      "remark": "Allow member profile to update shipping address? If the app doesn't include shipping products, then this is obsolete",
      "fieldType": "bool"
    },
    {
      "fieldName": "includeInvoiceAddress",
      "remark": "Allow member profile to update invoice address? If the app doesn't invoicing then this is obsolete",
      "fieldType": "bool"
    },
    {
      "fieldName": "includeSubscriptions",
      "remark": "Allow member profile to show subscriptions? If the app isn't a playstore, like minkey, then this is obsolete",
      "fieldType": "bool"
    },
    {
      "fieldName": "welcomeMessage",
      "displayName": "Welcome message",
      "fieldType": "String"
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
    "title": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))",
    "subTitle": "value.title != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.title!)) : Container()"
  }
}