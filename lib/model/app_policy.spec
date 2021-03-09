{
  "id": "AppPolicy",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": true,
    "generateRepository": true,
    "generateCache": true,
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
      "fieldName": "comments",
      "displayName": "Comments",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "privacyPolicy",
      "remark": "You might want to know who visits your website? Perhaps you allow members to join. Perhaps you keep track of store-sales. So your app/website may store personal user information. In these cases, most laws around the world require a privacy policy: 1) For the USA : The CalOPPA, the California Online Privacy Protection Act and the CCPA: California Consumer Privacy Act 2) For the EU: The GDPR, General Data Protection Regulation, 3) For Canada: PIPEDA, The personal information act, 4) Australia: The privacy act, 5) UK: The DPA, The Data Protection Act, etc. Make sure you comply. Provide a privacy policy",
      "displayName": "Privacy Policy",
      "fieldType": "String",
      "optional": true
    },
    {
      "fieldName": "termsAndConditions",
      "remark": "Set of rules and guidelines to be able to use your app/website. Inform that logo, content and other visuals are your property. Limit your liability. Inform e-commerce users how the purchasing process works. The terms and conditions gives you the rights to terminate abusive users."
      "displayName": "Terms and Conditions",
      "fieldType": "String",
      "optional": true
    },
    {
      "fieldName": "eulaAgreement",
      "remark": "This agreement between the owner of the app/website and the person downloading / installing it. You need this, e.g. if you want to make sure your website/app can not be used for illegal activity / spamming other users. Or e.g. to avoid being liable for expectations you can't meet, e.g. uptime, ...",
      "displayName": "End-User License Agreement",
      "fieldType": "String",
      "optional": true
    },
    {
      "fieldName": "cookiesPolicy",
      "remark": "Inform the user of the types of cookies your website uses",
      "displayName": "End-User License Agreement",
      "fieldType": "String",
      "optional": true
    },
    {
      "fieldName": "returnAndRefundPolicy",
      "remark": "This agreement is for ecommerce apps/websites where you inform people about refunds, return shipment cost, etc...",
      "displayName": "End-User License Agreement",
      "fieldType": "String",
      "optional": true
    },
    {
      "fieldName": "disclaimer",
      "remark": "A disclaimer is important to limit your liability. Are you promoting products or services? Better have a disclaimer! Or when you want to tell users information is to be used at their own risk: when you are offering recipes, instructions, advice, medical information, and other information people may use and rely on... at their own risk. An errors disclaimers can be used to make sure if your website/app fails, you are not reliable for loss users may have."
      "displayName": "Disclaimer",
      "fieldType": "String",
      "optional": true
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "comments"
  }
}