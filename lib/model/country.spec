{
  "id": "Country",
  "packageName": "eliud_core",
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
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "countryCode",
      "displayName": "Country Code",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "countryName",
      "displayName": "Country Name",
      "fieldType": "String",
      "iconName": "text_format",
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
    "title": "value.countryCode != null ? Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value.countryCode!)) : Container()",
    "subTitle": "value.countryName != null ? Center(child: StyleRegistry.registry().styleWithContext(context).adminListStyle().listItem(context, value.countryName!)) : Container()"
  }
}