{
  "id": "Page",
  "isAppModel": true,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
    "generateFirestoreRepository": true,
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
      "fieldName": "appId",
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
      "fieldName": "background",
      "displayName": "background",
      "fieldType": "Background",
      "association": true,
      "optional": true,
      "group": "background"
    },
    {
      "fieldName": "layout",
      "displayName": "Layout type",
      "fieldType": "enum",
      "enumName": "PageLayout",
      "enumValues" : [ "GridView", "ListView", "OnlyTheFirstComponent" ],
      "group": "layout"
    },
    {
      "fieldName": "gridView",
      "displayName": "GridView",
      "remark": "Specific gridview",
      "fieldType": "GridView",
      "association": true,
      "conditional": "(state.value.layout == PageLayout.GridView)",
      "group": "gridView"
    },
    {
      "fieldName": "conditional",
      "displayName": "Page accessibility",
      "remark": "Page only accessible conditionally",
      "fieldType": "enum",
      "enumName": "PageCondition",
      "enumValues" : [ "Always", "MustBeLoggedIn", "MustNotBeLoggedIn", "PluginDecides", "AdminOnly" ],
      "group": "conditional"
    },
    {
      "fieldName": "pluginCondition",
      "displayName": "Plugin condition",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "(state.value.conditional == PageCondition.PluginDecides)",
      "group": "conditional2"
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
        "conditional": "(state.value.layout == PageLayout.GridView)"
    },
    {
        "group": "conditional",
        "description": "Conditional"
    },
    {
        "group": "conditional2",
        "description": "Plugin Condition",
        "conditional": "(state.value.conditional == PageCondition.PluginDecides)"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "title"
  }
}