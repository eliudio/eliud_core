import 'package:cloud_firestore/cloud_firestore.dart';

import 'common_tools.dart';

Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, bool isLoggedIn, int privilegeLevel}) {
  Query useThisCollection = collection;
  // Are we ordering?
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending: descending);
  }

  // Do we have some limits in terms of privilege?
  if (isLoggedIn != null) {
    if (isLoggedIn) {
      useThisCollection = useThisCollection.where('privilegeLevelRequired', isLessThanOrEqualTo: privilegeLevel);
    } else {
      useThisCollection = useThisCollection.where('readCondition', isLessThan: 3);
    }
  }

  // Is this a query to limit the data to be retrieved for a specific member?
  if (currentMember != null) {
    useThisCollection = useThisCollection.where('readAccess',
        arrayContainsAny: ((currentMember == null) || (currentMember == "")) ? [
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
