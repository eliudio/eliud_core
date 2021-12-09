{
  "id": "GridView",
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
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "name",
      "displayName": "name",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "scrollDirection",
      "displayName": "Scroll Direction",
      "fieldType": "enum",
      "enumName": "GridViewScrollDirection",
      "enumValues" : [ "Horizontal", "Vertical" ],
      "group": "scrollDirection"
    },
    {
      "fieldName": "type",
      "displayName": "Grid Type",
      "fieldType": "enum",
      "enumName": "GridViewGridType",
      "enumValues" : [ "Count", "Extent" ],
      "group": "gridType"
    },
    {
      "fieldName": "crossAxisCount",
      "displayName": "Cross Axis Count",
      "remark": "Amount of components cross axis",
      "fieldType": "int",
      "conditional": "(state.value!.type == GridViewGridType.Count)",
      "group": "crossAxisCount"
    },
    {
      "fieldName": "maxCrossAxisExtentType",
      "displayName": "Type of determining the size of 'Max Cross Axis'",
      "remark": "Is this absolute amount of pixels or % of full width of the screen",
      "fieldType": "enum",
      "conditional": "(state.value!.type == GridViewGridType.Extent)",
      "enumName": "MaxCrossAxisExtentType",
      "enumValues" : [ "Absolute", "Relative" ],
      "group": "maxCrossAxisExtentType"
    },
    {
      "fieldName": "absoluteMaxCrossAxisExtent",
      "displayName": "Absolute Max Cross Axis Extent",
      "remark": "Absolute Max Cross Axis Extent",
      "fieldType": "double",
      "conditional": "((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Absolute))",
      "group": "absoluteMaxCrossAxisExtent"
    },
    {
      "fieldName": "relativeMaxCrossAxisExtent",
      "displayName": "Relative Max Cross Axis Extent",
      "remark": "Relative Max Cross Axis Extent",
      "fieldType": "double",
      "conditional": "((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Relative))",
      "group": "relativeMaxCrossAxisExtent"
    },
    {
      "fieldName": "childAspectRatio",
      "displayName": "ChildAspectRatio",
      "fieldType": "double",
      "group": "spec"
    },
    {
      "fieldName": "padding",
      "displayName": "Padding",
      "fieldType": "double",
      "group": "spec"
    },
    {
      "fieldName": "mainAxisSpacing",
      "displayName": "MainAxisSpacing",
      "fieldType": "double",
      "group": "spec"
    },
    {
      "fieldName": "crossAxisSpacing",
      "displayName": "CrossAxisSpacing",
      "fieldType": "double",
      "group": "spec"
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
        "group": "scrollDirection",
        "description": "Scroll Direction"
    },
    {
        "group": "gridType",
        "description": "gridType"
    },
    {
        "group": "crossAxisCount",
        "description": "crossAxisCount",
        "conditional": "(state.value!.type == GridViewGridType.Count)"
    },
    {
        "group": "maxCrossAxisExtentType",
        "description": "Max Cross Axis Extent Type",
        "conditional": "(state.value!.type == GridViewGridType.Extent)"
    },
    {
        "group": "absoluteMaxCrossAxisExtent",
        "description": "Absolute Max Cross Axis Extent",
        "conditional": "((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Absolute))"
    },
    {
        "group": "relativeMaxCrossAxisExtent",
        "description": "Relative Max Cross Axis Extent",
         "conditional": "((state.value!.type == GridViewGridType.Extent) && (state.value!.maxCrossAxisExtentType == MaxCrossAxisExtentType.Relative))"
    },
    {
        "group": "spec",
        "description": "Spec"
    },
    {
        "group": "conditional",
        "description": "Conditions"
    }
  ],
  "listFields": {
    "title": "value.name != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.name!)) : Container()"
  }
}