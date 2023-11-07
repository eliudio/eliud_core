{
  "id": "Dialog",
  "packageName": "eliud_core",
  "packageFriendlyName": "core",
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
    "documentSubCollectionOf": "app"
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
      "fieldName": "appId",
      "required": true,
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
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
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "bodyComponents",
      "displayName": "Components",
      "fieldType": "BodyComponent",
      "arrayType": "Array",
      "group": "components"
    },
    {
      "fieldName": "backgroundOverride",
      "displayName": "Background Override",
      "fieldType": "Background",
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "layout",
      "displayName": "Dialog Layout type",
      "fieldType": "enum",
      "enumName": "DialogLayout",
      "enumValues" : [ "gridView", "listView", "onlyTheFirstComponent" ],
      "group": "layout"
    },
    {
      "fieldName": "includeHeading",
      "displayName": "Include Heading",
      "fieldType": "bool"
    },
    {
      "fieldName": "gridView",
      "displayName": "GridView",
      "remark": "Specific gridview",
      "fieldType": "GridView",
      "association": true,
      "group": "gridView"
    },
    {
      "fieldName": "conditions",
      "displayName": "Conditions",
      "fieldType": "StorageConditions",
      "group": "conditional"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "menu",
        "description": "Home menu"
    },
    {
        "group": "components",
        "description": "Components"
    },
    {
        "group": "background",
        "description": "Background"
    },
    {
        "group": "layout",
        "description": "Layout"
    },
    {
        "group": "gridView",
        "description": "GridView"
    },
    {
        "group": "conditional",
        "description": "Conditional"
    },
    {
        "group": "conditional",
        "description": "Conditional"
    }
  ],
  "listFields": {
    "title": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))",
    "subTitle": "value.title != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.title!)) : Container()"
  }
}