{
  "id": "MemberMedium",
  "packageName": "eliud_core",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true,
    "isDocumentCollection": true
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
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "authorId",
      "displayName": "Author ID",
      "fieldType": "String"
    },
    {
      "fieldName": "url",
      "displayName": "Image URL",
      "fieldType": "String"
    },
    {
      "fieldName": "urlThumbnail",
      "displayName": "Image Thumbnail URL",
      "fieldType": "String"
    },
    {
      "fieldName": "readAccess",
      "displayName": "Members that can read this post. Array can contain 'public'",
      "fieldType": "String",
      "iconName": "text_format",
      "arrayType": "Array",
      "hidden": true
    },
    {
      "fieldName": "mediumType",
      "fieldType": "enum",
      "enumName": "MediumType",
      "enumValues" : [ "Photo", "Video" ]
    },
    {
      "fieldName": "mediumWidth",
      "fieldType": "int"
    },
    {
      "fieldName": "mediumHeight",
      "fieldType": "int"
    },
    {
      "fieldName": "thumbnailWidth",
      "fieldType": "int"
    },
    {
      "fieldName": "thumbnailHeight",
      "fieldType": "int"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "imageSource",
        "description": "Source"
    },
    {
        "group": "filename",
        "description": "Photo"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "url"
  }
}
