import 'package:firebase/firestore.dart';
import 'package:firebase/src/utils.dart';

Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, int privilegeLevel, String appId}) {
  Query useThisCollection = collection;
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending ? 'desc': 'asc');
  }
  // Do we have some limits in terms of privilege?
  if (privilegeLevel != null) {
    // Do we have some limits in terms of privilege?
    if (privilegeLevel == 0) {
      useThisCollection =
          useThisCollection.where('readCondition', '<', 3);
    } else {
      useThisCollection =
          useThisCollection.where('readCondition', '==', 3).where('privilegeLevelRequired', '==', privilegeLevel).where('appId', '==', appId);
    }
  }

  if (currentMember != null) {
    useThisCollection = useThisCollection.where(
        'readAccess', 'array-contains-any',
        ((currentMember == null) || (currentMember == '')) ? ['PUBLIC'] : [
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

DateTime timeStampToDateTime(dynamic timestamp) {
  // this doesn't work
  return dartify(timestamp);
}

String firestoreTimeStampToString(dynamic timestamp) {
  return timestamp.toString();
}
