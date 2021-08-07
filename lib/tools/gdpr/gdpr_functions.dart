import 'package:cloud_functions/cloud_functions.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';

import '../main_abstract_repository_singleton.dart';

class GDPR {
  static List<Map<String, String>> _toFunctionFormat(
      List<MemberCollectionInfo> memberCollectionInfo) {
    var collection = memberCollectionInfo
        .map(
          (info) =>
              {'name': info.name, 'memberIdentifier': info.memberIdentifier},
        )
        .toList();
    return collection;
  }

  static Future<void> dumpMemberData(String? appId, String? subject, String? from,
      List<MemberCollectionInfo> memberCollectionInfo) async {
    var dumpMemberData =
        FirebaseFunctions.instance.httpsCallable('dumpMemberData');
    await dumpMemberData.call(<String, dynamic>{
      'appId': appId,
      'subject': subject,
      'from': from,
      'collections': _toFunctionFormat(memberCollectionInfo)
    });
  }

  static Future<void> deleteMemberData(
      MemberModel member,
      String? appId,
      String? subject,
      String? from,
      String? message,
      List<MemberCollectionInfo> memberCollectionInfo) async {
    var deleteMemberData =
        FirebaseFunctions.instance.httpsCallable('deleteMemberData');
    await deleteMemberData.call(<String, dynamic>{
      'appId': appId,
      'subject': subject,
      'from': from,
      'message': message,
      'collections': _toFunctionFormat(memberCollectionInfo)
    });
    memberRepository()!.delete(member);
  }
}
