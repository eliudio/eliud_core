{
  "id": "MemberDashboard",
  "packageName": "eliud_core",
  "isAppModel": true,
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
    "generateEmbeddedComponent": false,
    "isExtension": true,
    "documentSubCollectionOf": "app"
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
      "fieldName": "appId",
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this belongs",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "group": "general"
    },

    {
      "fieldName": "updateProfileText",
      "remark": "This is the text on the member dashboard screen providing more information about what it means to update the member profile",
      "displayName": "Update Profile Text",
      "fieldType": "String",
      "group": "general"
    },

    {
      "fieldName": "retrieveDataText",
      "remark": "This is the text on the member dashboard screen providing more information about what it means to retrieve all data",
      "displayName": "Retrieve Data Text",
      "fieldType": "String",
      "group": "general"
    },

    {
      "fieldName": "deleteDataText",
      "remark": "This is the text on the member dashboard screen providing more information about what it means to destroy the account, i.e. the member will loose all data",
      "displayName": "Delete Data Text",
      "fieldType": "String",
      "group": "general"
    },

    {
      "fieldName": "retrieveDataEmailSubject",
      "remark": "This is the subject of the email providing the member his data stored in the app (after requesting it)",
      "displayName": "Retrieve Data Email Subject",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "deleteDataEmailSubject",
      "remark": "This is the subject of the email informing the member that his account and all of his data has been destroyed (after requesting it)",
      "displayName": "Delete Data Email Subject",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "deleteDataEmailMessage",
      "remark": "This is the message of the email informing the member that his account and all of his data has been destroyed (after requesting it)",
      "displayName": "Delete Data Email Message",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "StorageConditions",
      "group": "conditions"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "conditions",
        "description": "Conditions"
    }
 ],
  "listFields": {
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID!)) : Container()",
    "subTitle": "value.description != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.description!)) : Container()"
  },
  "depends": ["eliud_core"]
}