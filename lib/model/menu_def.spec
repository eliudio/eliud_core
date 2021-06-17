{
  "id": "MenuDef",
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
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key"
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
      "group": "general",
      "fieldValidation": "    // This could be written in 1 line. However, this is to illustrate how to write multiple lines of code\n    if (value!.length == 0) {\n      return false;\n    } else {\n      return true;\n    }\n",
      "defaultValue": "Name",
      "iconName": "text_format"
    },
    {
      "fieldName": "menuItems",
      "fieldType": "MenuItem",
      "group": "items",
      "arrayType": "Array"
    },
    {
      "fieldName": "admin",
      "hidden": true,
      "fieldType": "bool"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "items",
        "description": "Menu items"
    }
  ],
  "listFields": {
    "title": "documentID!",
    "subTitle": "name!"
  }
}
