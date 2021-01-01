{
  "id": "Notification",
  "packageName": "eliud_pkg_notifications",
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
    "isExtension": false,
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
      "fieldName": "timestamp",
      "displayName": "Timestamp",
      "fieldType": "ServerTimestamp",
      "group": "general",
      "hidden": true
    },
    {
      "fieldName": "appId",
      "displayName": "App Identifier",
      "remark": "This is the identifier of the app to which this feed belongs",
      "fieldType": "String",
      "group": "general",
      "hidden": true
    },
    {
      "fieldName": "description",
      "displayName": "Description",
      "fieldType": "String",
      "iconName": "text_format",
      "group": "general"
    },
    {
      "fieldName": "read",
      "displayName": "Has this been read?",
      "fieldType": "bool"
    },
    {
      "fieldName": "from",
      "displayName": "From",
      "fieldType": "Member",
      "association": true,
      "group": "from"
    },
    {
      "fieldName": "addresseeMemberId",
      "displayName": "Addressee MemberId",
      "fieldType": "String",
      "group": "addressee"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "member",
        "description": "Member"
    },
    {
        "group": "from",
        "description": "From"
    },
    {
        "group": "addressee",
        "description": "To"
    }
 ],
  "listFields": {
    "title": "timestamp.toString()",
    "subTitle": "documentID"
  },
  "depends": ["eliud_core"],
  "extraImports": {
    "alternative_list_widgets" : "import 'package:eliud_pkg_notifications/extensions/widgets/my_notification_list_item.dart';"
  },
  "alternativeListWidgets": [
    {
        "listItemWidget": "MyNotificationListItem"
    }
  ]
}