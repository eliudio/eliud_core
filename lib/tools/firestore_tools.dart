import 'package:cloud_firestore/cloud_firestore.dart';

import 'common_tools.dart';

Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, ReadCondition readCondition, int privilegeLevel}) {
  Query useThisCollection = collection;
  // Are we ordering?
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending: descending);
  }

  // Do we have some limits in terms of privilege?
  if (readCondition != null) {
    if (readCondition == ReadCondition.AsSpecifiedInPrivilegeLevelRequired) {
      if (privilegeLevel == null) {
        throw Exception(
            "When specifying AsSpecifiedInPrivilegeLevelRequired for readCondition you need to specify a privilegeLevel as well!");
      } else {
        useThisCollection = useThisCollection.where(
            'privilegeLevelRequired', isGreaterThanOrEqualTo: privilegeLevel);
      }
    } else {
      useThisCollection = useThisCollection.where(
          'readCondition', isEqualTo: readCondition.index);
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
