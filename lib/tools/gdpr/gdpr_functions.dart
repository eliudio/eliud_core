import 'package:cloud_functions/cloud_functions.dart';

Future<void> dumpMemberData(String appId, String subject, String from, ) async {
  var dumpMemberData = FirebaseFunctions.instance.httpsCallable(
      'dumpMemberData');
  await dumpMemberData.call(<String, dynamic>{
    'appId': appId,
    'subject': subject,
    'from': from,
    'collections': [
      {'name': 'post', 'memberIdentifier': 'authorId'},
      {'name': 'membermedium', 'memberIdentifier': 'authorId'},
    ]
  }).then((response) {
    print("Done");
  });
}

Future<void> deleteMemberData(String appId, String subject, String from, String message) async {
  var deleteMemberData = FirebaseFunctions.instance
      .httpsCallable('deleteMemberData');
  await deleteMemberData.call(<String, dynamic>{
    'appId': appId,
    'subject': subject,
    'from': from,
    'message': 'Your account and all your data from the minkey app has been deleted successfully',
    'collections': [
      {'name': 'post', 'memberIdentifier': 'authorId'},
      {'name': 'membermedium', 'memberIdentifier': 'authorId'},
    ]
  }).then((response) {
    print("Done");
  });
}