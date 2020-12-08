{
  "id": "Member",
  "packageName": "eliud_core",
  "isAppModel": false,
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
	"hasPersistentRepository": true,
    "generateFirestoreRepository": false,
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
      "remark": "User UUID",
      "displayName": "User UUID",
      "fieldType": "String",
      "iconName": "vpn_key",
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
      "fieldName": "subscriptions",
      "displayName": "Subscriptions",
      "fieldType": "MemberSubscription",
      "arrayType": "Array",
      "group": "subscriptions"
    },
    {
      "fieldName": "photoURL",
      "displayName": "Profile Photo",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general",
      "hidden": true
    },
    {
      "fieldName": "shipStreet1",
      "displayName": "Street Address",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "shipStreet2",
      "displayName": "Street Address Line 2",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "shipCity",
      "displayName": "City",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "shipState",
      "displayName": "State/Province",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "postcode",
      "displayName": "Postal / Zip Code",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "ship"
    },
    {
      "fieldName": "country",
      "displayName": "Country",
      "fieldType": "Country",
      "association": true,
      "optional": false,
      "group": "shipCountry"
    },
    {
      "fieldName": "invoiceSame",
      "displayName": "Invoice address same as shipping address",
      "fieldType": "bool",
      "defaultValue": "true",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceStreet1",
      "displayName": "Street Address",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceStreet2",
      "displayName": "Street Address Line 2",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceCity",
      "displayName": "City",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceState",
      "displayName": "State/Province",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))",
      "group": "invoice"
    },
    {
      "fieldName": "invoicePostcode",
      "displayName": "Postal / Zip Code",
      "fieldType": "String",
      "iconName": "text_format",
      "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))",
      "group": "invoice"
    },
    {
      "fieldName": "invoiceCountry",
      "displayName": "Country",
      "fieldType": "Country",
      "association": true,
      "optional": false,
      "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))",
      "group": "invoiceCountry"
    },
    {
      "fieldName": "readAccess",
      "displayName": "Members that can read the data of this user",
      "fieldType": "String",
      "iconName": "text_format",
      "arrayType": "Array",
      "hidden": true
    },
    {
      "fieldName": "email",
      "displayName": "Email address",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "isAnonymous",
      "displayName": "Is Anonymous",
      "fieldType": "bool",
      "group": "general"
    },
    {
      "fieldName": "packageData",
      "fieldType": "bespoke",
      "bespokeFieldType": "Map<String, Object>",
      "bespokeEntityMapping": "(map['packageData'] as Map<String, dynamic>).map((key, dynamic item) => MapEntry(key, jsonEncode(item)))",
      "bespokeEntityToDocument" : "    if (packageData != null) {\n      var myMap = Map();\n      packageData.forEach((key, value) {\n        myMap[key] = jsonDecode(value);\n      });\n      theDocument['packageData'] = myMap;\n    } else theDocument['packageData'] = null;\n"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "subscriptions",
        "description": "Subscriptions"
    },
    {
        "group": "cartItem",
        "description": "Cart"
    },
    {
        "group": "group",
        "description": "User Group"
    },
    {
        "group": "access",
        "description": "Access"
    },
    {
        "group": "ship",
        "description": "Shipping Address"
    },
    {
        "group": "shipCountry",
        "description": "Shipping Country"
    },
    {
        "group": "invoice",
        "description": "Invoice Address",
        "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))"
    },
    {
        "group": "invoiceCountry",
        "description": "Invoice Country",
        "conditional": "((state.value.invoiceSame == null) || (!state.value.invoiceSame))"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "name"
  },
  "preToEntityCode": "readAccess = subscriptions.map((subscription) => subscription.app.ownerID).toList();",
  "preMapUpdateCode": "    var state = accessBloc.state;\n    if (state is LoggedIn) {\n        // normally I can only update myself, but checking regardless\n        if (event.value.documentID == state.member.documentID) {\n            await accessBloc.add(MemberUpdated(event.value));\n        }\n    }",
  "extraImports": {
    "firestore" : "import 'package:eliud_core/core/global_data.dart';",
    "list_bloc": "import 'package:eliud_core/core/access/bloc/access_state.dart';"
  },
  "alternativeViews": [
    {
        "name": "Small",
        "fields": [ "name", "subscriptions" ],
        "groups" : [ "general", "subscriptions" ]
    },
    {
        "name": "Address",
        "title": "Confirm Delivery Address",
        "buttonLabel": "Finish Order",
        "fields": [ "name", "email",
                    "shipStreet1", "shipStreet2", "shipCity", "shipState", "postcode", "country", "invoiceSame",
                    "invoiceStreet1", "invoiceStreet2", "invoiceCity", "invoiceState", "invoicePostcode", "invoiceCountry"
                  ],
        "groups": [ "ship", "shipCountry", "invoice", "invoiceCountry" ]
    }
  ]
}



