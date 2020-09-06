{
  "id": "BodyComponent",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": true,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "componentName",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "componentName",
      "group": "componentName",
      "remark": "The component name, such as 'carousel' which is required on this body",
      "fieldType": "String",
      "bespokeFormField": "ExtensionTypeField"
    },
    {
      "fieldName": "componentId",
      "group": "componentId",
      "remark": "For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page",
      "fieldType": "String",
      "bespokeFormField": "ComponentIdField(componentName: state.value.componentName, value: state.value.componentId, trigger: _onComponentIdChanged)"
    }
  ],
  "groups": [
    {
        "group": "componentName",
        "description": "Component"
    },
    {
        "group": "componentId",
        "description": "Component spec"
    }
  ],
  "listFields": {
    "title": "componentName",
    "subTitle": "componentId"
  }
}
