import 'package:firebase/firestore.dart';

import 'common_tools.dart';

Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, ReadCondition readCondition, int privilegeLevel}) {
  Query useThisCollection = collection;
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending ? 'desc': 'asc');
  }
  // Do we have some limits in terms of privilege?
  if (readCondition != null) {
    if (readCondition == ReadCondition.AsSpecifiedInPrivilegeLevelRequired) {
      if (privilegeLevel == null) {
        throw Exception(
            "When specifying AsSpecifiedInPrivilegeLevelRequired for readCondition you need to specify a privilegeLevel as well!");
      } else {
        useThisCollection = useThisCollection.where(
            'privilegeLevelRequired', 'is-greater-than-or-equal-to', privilegeLevel);
      }
    } else {
      useThisCollection = useThisCollection.where(
          'readCondition', 'is-equal-to', readCondition.index);
    }
  }

  if (currentMember != null) {
    useThisCollection = useThisCollection.where(
        'readAccess', 'array-contains-any',
        ((currentMember == null) || (currentMember == "")) ? ['PUBLIC'] : [
          currentMember,
          'PUBLIC'
        ]);
  }
  if (startAfter != null) {
    useThisCollection = useThisCollection.startAfter(snapshot: startAfter);
  }
  if (limit != null) {
    useThisCollection = useThisCollection.limit(limit);
  }
  return useThisCollection;
}
