import 'package:cloud_functions/cloud_functions.dart';
import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/backend_request_model.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';

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

  static Future<void> dumpMemberDataOld(String? appId, String? subject,
      String? from, List<MemberCollectionInfo> memberCollectionInfo) async {
    var dumpMemberData =
        FirebaseFunctions.instance.httpsCallable('dumpMemberData');
    await dumpMemberData.call(<String, dynamic>{
      'appId': appId,
      'subject': subject,
      'from': from,
      'collections': _toFunctionFormat(memberCollectionInfo)
    });
  }

  static Future<void> dumpMemberData(MemberModel member, String appId,
      String? subject, List<MemberCollectionInfo> memberCollectionInfo) async {
    /*var dumpMemberData =
        */
    FirebaseFunctions.instance.httpsCallable('dumpMemberData');

    await backendRequestRepository(appId: appId)!.add(BackendRequestModel(
        documentID: newRandomKey(),
        appId: appId,
        name: member.name,
        sendTo: member.email,
        description: subject,
        authorId: member.documentID,
        processed: false,
        requestType: RequestType.requestEmailData,
        collections: _toFunctionFormat(memberCollectionInfo)));
  }

  static Future<void> deleteMemberDataOld(
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

  static Future<void> deleteMemberData(
      MemberModel member,
      String appId,
      String? subject,
      String? from,
      String? message,
      List<MemberCollectionInfo> memberCollectionInfo) async {
    /*var dumpMemberData =
        */
    FirebaseFunctions.instance.httpsCallable('dumpMemberData');

    await backendRequestRepository(appId: appId)!.add(BackendRequestModel(
        documentID: newRandomKey(),
        appId: appId,
        name: member.name,
        sendTo: member.email,
        description: subject,
        authorId: member.documentID,
        processed: false,
        requestType: RequestType.destroyAccount,
        collections: _toFunctionFormat(memberCollectionInfo)));
  }
}
