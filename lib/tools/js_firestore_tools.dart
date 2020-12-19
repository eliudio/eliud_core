import 'package:firebase/firestore.dart';

import 'common_tools.dart';

Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, bool isLoggedIn, int privilegeLevel}) {
  Query useThisCollection = collection;
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending ? 'desc': 'asc');
  }
  // Do we have some limits in terms of privilege?
  if (isLoggedIn != null) {
    if (isLoggedIn) {
      useThisCollection = useThisCollection.where('privilegeLevelRequired', "<=", privilegeLevel);
    } else {
      useThisCollection = useThisCollection.where('readCondition', '<', 3);
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
