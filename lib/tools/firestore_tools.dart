import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// process:
// If member has privilegeLevel >= 1, then
//     query the pages and dialogs. Pass in privilegeLevel = 3, 2 and 1 and then merge results from query with privilegeLevel = 3, privilegeLevel = 2 and privilegeLevel = 1
//     (if privilegeLevel = 2, then do this for 2 and 1, if privilegeLevel = 1, then do this for 1)
//
//     query the pages with privilegeLevel = 0
//
// If not logged in, or if privilegeLevel <= 0, theh query the pages with privilegeLevel = 0
Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, int privilegeLevel, String appId}) {
  Query useThisCollection = collection;
  // Are we ordering?
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending: descending);
  }

  if (privilegeLevel != null) {
    // Do we have some limits in terms of privilege?
    if (privilegeLevel == 0) {
      useThisCollection =
          useThisCollection.where('readCondition', isLessThan: 3);
    } else {
      useThisCollection =
          useThisCollection.where('readCondition', isEqualTo: 3).where(
              'privilegeLevelRequired', isEqualTo: privilegeLevel).where(
              'appId', isEqualTo: appId);
    }
  }

  // Is this a query limitting the data to be retrieved for a specific member? e.g. posts are limitted to people the post is addressed to.
  if (currentMember != null) {
    useThisCollection = useThisCollection.where('readAccess',
        arrayContainsAny: ((currentMember == null) || (currentMember == '')) ? [
          'PUBLIC'
        ] : [currentMember, 'PUBLIC']);
  }

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
