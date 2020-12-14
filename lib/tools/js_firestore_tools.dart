import 'package:firebase/firestore.dart';

Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit}) {
  Query useThisCollection = collection;
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending ? 'desc': 'asc');
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
