{
  "id": "App",
  "packageName": "eliud_core",
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
      "fieldName": "ownerID",
      "displayName": "Owner ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general",
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
      "fieldName": "email",
      "displayName": "Contact email",
      "fieldType": "String",
      "iconName": "email",
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
      "fieldName": "appStatus",
      "displayName": "Status of your application",
      "fieldType": "enum",
      "enumName": "AppStatus",
      "enumValues" : [ "Live", "Offline", "Invisible" ],
      "group": "appStatus"
    },
    {
      "fieldName": "darkOrLight",
      "displayName": "Dark or Light Mode",
      "fieldType": "enum",
      "enumName": "DarkOrLight",
      "enumValues" : [ "Dark", "Light" ],
      "group": "darkOrLight"
    },
    {
      "fieldName": "entryPage",
      "displayName": "Entry Page",
      "fieldType": "Page",
      "association": true,
      "optional": false,
      "iconName": "play_arrow",
      "group": "main"
    },
    {
      "fieldName": "logo",
      "fieldType": "Image",
      "association": true,
      "optional": true,
      "iconName": "add_a_photo",
      "group": "logo"
    },
    {
      "fieldName": "formSubmitButtonColor",
      "displayName": "Button Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "formColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Form Submit Button Color\", state.value.formSubmitButtonColor, _onFormSubmitButtonColorChanged)"
    },
    {
      "fieldName": "formBackground",
      "displayName": "Form Background",
      "fieldType": "Background",
      "association": true,
      "optional": true,
      "group": "formBackground"
    },
    {
      "fieldName": "formSubmitButtonTextColor",
      "displayName": "Form Submit Button Text Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "formColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Form Submit Button Text Color\", state.value.formSubmitButtonTextColor, _onFormSubmitButtonTextColorChanged)"
    },
    {
      "fieldName": "formGroupTitleColor",
      "displayName": "Form Group Title Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 0, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "formColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Form Group Title Color\", state.value.formGroupTitleColor, _onFormGroupTitleColorChanged)"
    },
    {
      "fieldName": "formFieldTextColor",
      "displayName": "Form Field Text Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "formColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Form Field Text Color\", state.value.formFieldTextColor, _onFormFieldTextColorChanged)"
    },
    {
      "fieldName": "formFieldHeaderColor",
      "displayName": "Form Field Header Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 0, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "otherColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Form Field Header Color\", state.value.formFieldHeaderColor, _onFormFieldHeaderColorChanged)"
    },
    {
      "fieldName": "formFieldFocusColor",
      "displayName": "Form Field Focus Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 0, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "formColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Form Field Focus Color\", state.value.formFieldFocusColor, _onFormFieldFocusColorChanged)"
    },
    {
      "fieldName": "formAppBarBackground",
      "displayName": "AppBar Form Background",
      "fieldType": "Background",
      "association": true,
      "optional": true,
      "group": "formAppBarBackground"
    },
    {
      "fieldName": "formAppBarTextColor",
      "displayName": "Form App Bar Text Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "formColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Form App Bar Text color\", state.value.formAppBarTextColor, _onFormAppBarTextColorChanged)"
    },
    {
      "fieldName": "listBackground",
      "displayName": "List Background",
      "fieldType": "Background",
      "association": true,
      "optional": true,
      "group": "listBackground"
    },
    {
      "fieldName": "listTextItemColor",
      "displayName": "List Item Text Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "listColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"List Item Text Color\", state.value.listTextItemColor, _onListTextItemColorChanged)"
    },
    {
      "fieldName": "floatingButtonForegroundColor",
      "displayName": "Floating Button Foreground Color",
      "defaultValue": "RgbModel(r: 255, g: 255, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "floatingbuttonColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"List Item Text Color\", state.value.floatingButtonForegroundColor, _onFloatingButtonForegroundColorChanged)"
    },
    {
      "fieldName": "floatingButtonBackgroundColor",
      "displayName": "Floating Button Background Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 255, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "floatingbuttonColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"List Item Text Color\", state.value.floatingButtonBackgroundColor, _onFloatingButtonBackgroundColorChanged)"
    },
    {
      "fieldName": "dividerColor",
      "displayName": "Divider Color",
      "defaultValue": "RgbModel(r: 255, g: 0, b: 0, opacity: 1.00)",
      "fieldType": "Rgb",
      "group": "otherColors",
      "iconName": "color_lens",
      "bespokeFormField": "RgbField(\"Divider Color\", state.value.dividerColor, _onDividerColorChanged)"
    },
    {
      "fieldName": "routeBuilder",
      "displayName": "Page Route Builder",
      "fieldType": "enum",
      "enumName": "PageTransitionAnimation",
      "enumValues" : [ "SlideRightToLeft", "SlideBottomToTop", "ScaleRoute", "RotationRoute", "FadeRoute" ],
      "group": "route"
    },
    {
      "fieldName": "routeAnimationDuration",
      "displayName": "Page Animation (millisec)",
      "fieldType": "int",
      "defaultValue": "1000",
      "group": "route"
    },
    {
      "fieldName": "logoURL",
      "remark": "This is a copy of logo.imageURLOriginal because logo.imageURLOriginal is not accessible as a cross-app document. Hence we copy it into this field.",
      "fieldType": "String",
      "hidden": true
    },
    {
      "fieldName": "h1",
      "displayName": "Font header 1",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontH1"
    },
    {
      "fieldName": "h2",
      "displayName": "Font header 2",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontH2"
    },
    {
      "fieldName": "h3",
      "displayName": "Font header 3",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontH3"
    },
    {
      "fieldName": "h4",
      "displayName": "Font header 4",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontH4"
    },
    {
      "fieldName": "h5",
      "displayName": "Font header 5",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontH5"
    },
    {
      "fieldName": "fontText",
      "displayName": "Font Text",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontText"
    },
    {
      "fieldName": "fontHighlight1",
      "displayName": "Font Bold Text",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontHighlight1"
    },
    {
      "fieldName": "fontHighlight2",
      "displayName": "Font Bold Text",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontHighlight2"
    },
    {
      "fieldName": "fontLink",
      "displayName": "Font Link",
      "fieldType": "Font",
      "association": true,
      "optional": true,
      "group": "fontLink"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "owner",
        "description": "Owner"
    },
    {
        "group": "darkOrLight",
        "description": "Dark or Light"
    },
    {
        "group": "main",
        "description": "Entry Page"
    },
    {
        "group": "logo",
        "description": "Logo"
    },
    {
        "group": "formColors",
        "description": "Form Colors"
    },
    {
        "group": "listColors",
        "description": "List Items Colors"
    },
    {
        "group": "floatingbuttonColors",
        "description": "Floating Button Colors"
    },
    {
        "group": "otherColors",
        "description": "Other Colors"
    },
    {
        "group": "formBackground",
        "description": "Background forms"
    },
    {
        "group": "formAppBarBackground",
        "description": "Form AppBar Background"
    },
    {
        "group": "listBackground",
        "description": "List Background"
    },
    {
        "group": "flush",
        "description": "Flush Cache"
    },
    {
        "group": "route",
        "description": "Page Route Builder"
    },
    {
        "group": "appStatus",
        "description": "Status of the application"
    },
    {
        "group": "fontH1",
        "description": "Font header 1"
    },
    {
        "group": "fontH2",
        "description": "Font header 2"
    },
    {
        "group": "fontH3",
        "description": "Font header 3"
    },
    {
        "group": "fontH4",
        "description": "Font header 4"
    },
    {
        "group": "fontH5",
        "description": "Font header 5"
    },
    {
        "group": "fontText",
        "description": "Font header 5"
    },
    {
        "group": "fontHighlight1",
        "description": "Font highlight 1"
    },
    {
        "group": "fontHighlight2",
        "description": "Font hightlight 2"
    },
    {
        "group": "linkFont",
        "description": "Font Link"
    }
  ],
  "listFields": {
    "title": "documentID",
    "subTitle": "title"
  },
  "preToEntityCode": "logoURL = logo != null ? logo.imageURLOriginal : null;"
}