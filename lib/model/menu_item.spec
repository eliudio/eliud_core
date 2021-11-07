{
  "id": "MenuItem",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": true,
    "generateList": true,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "text",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format"
    },
    {
      "fieldName": "description",
      "group": "general",
      "fieldType": "String",
      "iconName": "text_format"
    },
    {
      "fieldName": "icon",
      "group": "icon",
      "fieldType": "Icon",
      "bespokeFormField": "IconField"
    },
    {
      "fieldName": "action",
      "group": "action",
      "fieldType": "Action",
      "bespokeFormField": "ActionField(AppBloc.currentAppId(context), state.value!.action, _onActionChanged)"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "action",
        "description": "Action"
    },
    {
        "group": "icon",
        "description": "Icon"
    }
  ],
  "listFields": {
    "title": "value.text != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.text!)) : Container()",
    "subTitle": "value.description != null ? Center(child: StyleRegistry.registry().styleWithContext(context).frontEndStyle().textStyle().text(context, value.description!)) : Container()"
  }
}