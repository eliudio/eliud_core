{
  "id": "PublicMedium",
  "packageName": "eliud_core",
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
      "fieldName": "authorId",
      "displayName": "Author ID",
      "fieldType": "String"
    },
    {
      "fieldName": "baseName",
      "displayName": "Base Name",
      "fieldType": "String"
    },
    {
      "fieldName": "url",
      "displayName": "Image URL",
      "fieldType": "String"
    },
    {
      "fieldName": "ref",
      "displayName": "Image Ref on Firebase Storage",
      "fieldType": "String"
    },
    {
      "fieldName": "urlThumbnail",
      "displayName": "Image Thumbnail URL",
      "fieldType": "String"
    },
    {
      "fieldName": "refThumbnail",
      "displayName": "Image Ref on Firebase Storage",
      "fieldType": "String"
    },
    {
      "fieldName": "mediumType",
      "fieldType": "enum",
      "enumName": "PublicMediumType",
      "enumValues" : [ "Photo", "Video", "Pdf" ]
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
    },
    {
      "fieldName": "relatedMediumId",
      "remark": "In case a medium has multiple related media, then we refer to the related media with this field. For example, for a pdf, we store images of all pages. These are referenced using a chain of these references.",
      "fieldType": "String"
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
    "title": "value.documentID != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.documentID!)) : Container()",
    "subTitle": "value.url != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.url!)) : Container()"
  }
}