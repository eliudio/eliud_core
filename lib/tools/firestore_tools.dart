import 'package:cloud_firestore/cloud_firestore.dart';

import 'common_tools.dart';

// pass in parameters isSignedIn, isMember and isPrivilegedMember
// if isPrivilegedMember, than query for documents which have readCondition = 3 and privilegedMemberAccess = true and merge it with documents with the below
//       useThisCollection = useThisCollection.where('readCondition', isEqualTo: 3).where('privilegedMemberAccess', isEqualTo: true).where("appId",isEqualTo: "MINKEY_APP");
// if isMember, than query for documents which have memberAccess which have readCondition = 3 and isMember = true
//      useThisCollection = useThisCollection.where('readCondition', isEqualTo: 3).where('memberAccess', isEqualTo: true).where("appId",isEqualTo: "MINKEY_APP");
// in other cases (i.e. not isMember and not isPrivilegedMember) then we're only interested in documents with readCondition < 3
//      useThisCollection = useThisCollection.where('readCondition', isLessThan: 3);
Query getQuery(CollectionReference collection, {String currentMember, String orderBy, bool descending, DocumentSnapshot startAfter, int limit, bool isLoggedIn, int privilegeLevel}) {
  Query useThisCollection = collection;
  // Are we ordering?
  if (orderBy != null) {
    useThisCollection = useThisCollection.orderBy(orderBy, descending: descending);
  }

  // Do we have some limits in terms of privilege?
  if (isLoggedIn != null) {
    if (isLoggedIn) {
//    useThisCollection = useThisCollection.where('readCondition', isEqualTo: 2).where('privilegeLevelRequired', isEqualTo: 1).where("appId",isEqualTo: "MINKEY_APP");
//    useThisCollection = useThisCollection.where('readCondition', isEqualTo: 2).where('memberAccess', isEqualTo: true).where("appId",isEqualTo: "MINKEY_APP");
//    useThisCollection = useThisCollection.where('readCondition', isEqualTo: 2).where('privilegedMemberAccess', isEqualTo: true).where("appId",isEqualTo: "MINKEY_APP");
    } else {
      useThisCollection = useThisCollection.where('readCondition', isLessThan: 2);
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
