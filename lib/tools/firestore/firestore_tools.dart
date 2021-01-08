import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core/tools/query/query_tools.dart';
import 'package:intl/intl.dart';

// process:
// If member has privilegeLevel >= 1, then
//     query the pages and dialogs. Pass in privilegeLevel = 3, 2 and 1 and then merge results from query with privilegeLevel = 3, privilegeLevel = 2 and privilegeLevel = 1
//     (if privilegeLevel = 2, then do this for 2 and 1, if privilegeLevel = 1, then do this for 1)
//
//     query the pages with privilegeLevel = 0
//
// If not logged in, or if privilegeLevel <= 0, theh query the pages with privilegeLevel = 0
Query getQuery(collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, int privilegeLevel, String appId, EliudQuery eliudQuery}) {
  Query useThisCollection = collection;
  // Are we ordering?
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending: descending);
  }

  if (privilegeLevel != null) {
    // Do we have some limits in terms of privilege?
      useThisCollection =
          useThisCollection.where('conditions.privilegeLevelRequired', isEqualTo: privilegeLevel).where(
              'appId', isEqualTo: appId);
  }

  if ((eliudQuery != null) && (eliudQuery.conditions != null) && (eliudQuery.conditions.isNotEmpty)) {
    for (var i = 0; i < eliudQuery.conditions.length; i++) {
      var condition = eliudQuery.conditions[i];
      if (condition.isLessThanOrEqualTo != null) {
        useThisCollection =
            useThisCollection.where(condition.field, isLessThanOrEqualTo: condition.isLessThanOrEqualTo);
      }
      if (condition.isLessThan != null) {
        useThisCollection =
            useThisCollection.where(condition.field, isLessThan: condition.isLessThan);
      }
      if (condition.isEqualTo != null) {
        useThisCollection =
            useThisCollection.where(condition.field, isEqualTo: condition.isEqualTo);
      }
      if (condition.isGreaterThanOrEqualTo != null) {
        useThisCollection =
            useThisCollection.where(condition.field, isGreaterThanOrEqualTo: condition.isGreaterThanOrEqualTo);
      }
      if (condition.isGreaterThan != null) {
        useThisCollection =
            useThisCollection.where(condition.field, isGreaterThan: condition.isGreaterThan);
      }
      if (condition.isNull != null) {
        useThisCollection =
            useThisCollection.where(condition.field, isNull: condition.isNull);
      }
      if (condition.arrayContains != null) {
        useThisCollection =
            useThisCollection.where(condition.field, arrayContains: condition.arrayContains);
      }
      if (condition.arrayContainsAny != null) {
        useThisCollection =
            useThisCollection.where(condition.field, arrayContainsAny: condition.arrayContainsAny);
      }
      if (condition.whereIn != null) {
        useThisCollection =
            useThisCollection.where(condition.field, whereIn: condition.whereIn);
      }
    }
  }

/*
  // Is this a query limitting the data to be retrieved for a specific member? e.g. posts are limitted to people the post is addressed to.
  if (currentMember != null) {
    useThisCollection = useThisCollection.where('readAccess',
        arrayContainsAny: ((currentMember == null) || (currentMember == '')) ? [
          'PUBLIC'
        ] : [currentMember, 'PUBLIC']);
  }
*/

  // Are we paginating?
  if (startAfter != null) {
    useThisCollection = useThisCollection.startAfterDocument(startAfter);
  }
  if (limit != null) {
    useThisCollection = useThisCollection.limit(limit);
  }
  return useThisCollection;
}

DateTime timeStampToDateTime(Timestamp timestamp) {
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  }
}

String firestoreTimeStampToString(dynamic timestamp) {
  if (timestamp is Timestamp) {
    return DateFormat("dd MMM yyyy hh:mm").format(timestamp.toDate());
  } else {
    return null;
  }
}