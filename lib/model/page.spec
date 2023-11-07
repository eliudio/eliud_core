{
  "id": "Page",
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
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "title",
      "displayName": "Title",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "appBar",
      "displayName": "App Bar",
      "fieldType": "AppBar",
      "association": true,
      "optional": true,
      "group": "appbar"
    },
    {
      "fieldName": "drawer",
      "displayName": "Drawer",
      "fieldType": "Drawer",
      "association": true,
      "optional": true,
      "group": "drawer"
    },
    {
      "fieldName": "endDrawer",
      "displayName": "Drawer",
      "fieldType": "Drawer",
      "association": true,
      "optional": true,
      "group": "endDrawer"
    },
    {
      "fieldName": "homeMenu",
      "displayName": "Home Menu",
      "fieldType": "HomeMenu",
      "association": true,
      "optional": true,
      "group": "menu"
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
      "remark": "Override the style background",
      "displayName": "Background Override",
      "fieldType": "Background",
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "layout",
      "displayName": "Layout type",
      "fieldType": "enum",
      "enumName": "PageLayout",
      "enumValues" : [ "gridView", "listView", "onlyTheFirstComponent" ],
      "group": "layout"
    },
    {
      "fieldName": "gridView",
      "displayName": "GridView",
      "remark": "Specific gridview",
      "fieldType": "GridView",
      "association": true,
      "conditional": "(state.value!.layout == PageLayout.gridView)",
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
        "group": "drawer",
        "description": "Drawer"
    },
    {
        "group": "endDrawer",
        "description": "End Drawer"
    },
    {
        "group": "appbar",
        "description": "App Bar"
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
        "description": "GridView",
        "conditional": "(state.value!.layout == PageLayout.gridView)"
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