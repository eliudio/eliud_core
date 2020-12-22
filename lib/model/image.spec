{
  "id": "Image",
  "packageName": "eliud_core",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": true,
    "generateEmbeddedComponent": false,
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
      "fieldName": "name",
      "displayName": "Name",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "source",
      "defaultValue": "SourceImage.Upload",
      "displayName": "Source",
      "remark": "Where do you want to retrieve your image from. Upload can come with GCP charge. Consider a photo hosting service, e.g. flickr or alternative (https://beebom.com/flickr-alternatives/)",
      "fieldType": "enum",
      "enumName": "SourceImage",
      "group": "imageSource",
      "enumValues" : [ "Upload", "SpecifyURL", "YourProfilePhoto" ]
    },
    {
      "fieldName": "imageURLOriginal",
      "displayName": "Image URL",
      "fieldType": "String",
      "group": "filename",
      "bespokeFormField": "ImageField(state.value.source, state.value.imageURLOriginal, _onImageURLOriginalChanged)"
    },
    {
      "fieldName": "imageURLThumbnail",
      "displayName": "Image URL",
      "fieldType": "String",
      "group": "filename",
      "hidden": true
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
    "subTitle": "imageURLThumbnail",
    "imageSubTitle": true
  }
}
