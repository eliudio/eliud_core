{
  "id": "Dialog",
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
      "fieldName": "bodyComponents",
      "displayName": "Components",
      "fieldType": "BodyComponent",
      "arrayType": "Array",
      "group": "components"
    },
    {
      "fieldName": "background",
      "displayName": "Background Color",
      "defaultValue": "RgbModel(r: 211, g: 211, b: 211, opacity: 0.50)",
      "fieldType": "Rgb",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Background Color\", state.value.background, _onBackgroundChanged)",
      "group": "background"
    },
    {
      "fieldName": "layout",
      "displayName": "Dialog Layout type",
      "fieldType": "enum",
      "enumName": "DialogLayout",
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
      "fieldName": "readCondition",
      "displayName": "Page accessibility",
      "remark": "Page only accessible conditionally. See type definition for more info",
      "fieldType": "bespoke",
      "bespokeFieldType": "ReadCondition",
      "bespokeEntityMapping": "toReadCondition(map['readCondition'])",
      "bespokeEntityToDocument" : "    if (readCondition != null) theDocument['readCondition'] = readCondition.index; else theDocument['readCondition'] = null;",
      "group": "conditional"
    },
    {
      "fieldName": "privilegeLevelRequired",
      "displayName": "Privilege Level Required",
      "fieldType": "int",
      "conditional": "(state.value.privilegeLevelRequired == ReadCondition.MemberOrPrivilegedMemberOnly)",
      "group": "conditional"
    },
    {
      "fieldName": "packageCondition",
      "displayName": "Package condition",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "(state.value.packageCondition == ReadCondition.PackageDecides)",
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
        "conditional": "(state.value.packageCondition == ReadCondition.PackageDecides)"
    },
    {
        "group": "conditional",
        "description": "Conditional"
    },
    {
        "group": "conditional2",
        "description": "Plugin Condition",
        "conditional": "(state.value.packageCondition == ReadCondition.PackageDecides)"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "title"
  }
}