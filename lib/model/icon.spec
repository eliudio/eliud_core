{
  "id": "Icon",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": false,
    "generateRepository": false,
    "generateCache": false,
    "generateFirestoreRepository": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": false
  },
  "fields": [
    {
      "fieldName": "codePoint",
      "remark": "The Unicode code point at which this icon is stored in the icon font. For example, for materialicon 'Home', use codePoint: 0xe88a. Find the codePoint from sources such as https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/icons.dart, https://github.com/google/material-design-icons/blob/master/iconfont/codepoints, https://material.io/resources/icons or ...",
      "fieldType": "int"
    },
    {
      "fieldName": "fontFamily",
      "remark": "The font family from which the glyph for the codePoint will be selected. For example MaterialIcons",
      "fieldType": "String"
    }
  ]
}
