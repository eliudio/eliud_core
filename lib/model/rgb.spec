{
  "id": "Rgb",
  "packageName": "eliud_core",
  "generate": {
    "generateComponent": false,
    "generateRepository": false,
    "generateCache": false,
	"hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
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
      "fieldName": "r",
      "remark": "r is red, from 0 to 255. An out of range value is brought into range using modulo 255.",
      "fieldType": "int"
    },
    {
      "fieldName": "g",
      "remark": "g is green, from 0 to 255. An out of range value is brought into range using modulo 255.",
      "fieldType": "int"
    },
    {
      "fieldName": "b",
      "remark": "b is blue, from 0 to 255. An out of range value is brought into range using modulo 255.",
      "fieldType": "int"
    },
    {
      "fieldName": "opacity",
      "remark": "opacity is alpha channel of this color as a double, with 0.0 being transparent and 1.0 being fully opaque.",
      "fieldType": "double"
    }
  ]
}