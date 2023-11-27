import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';
import 'access_state.dart';

class AccessError extends AccessState {
  final String message;

  AccessError(this.message);

  @override
  List<Object> get props => [message];

  @override
  bool isLoggedIn() => false;

  @override
  bool hasAccessToOtherApps() => false;

  @override
  bool forceAcceptMembership(String appId) => false;

  @override
  bool memberIsOwner(String appId) => false;

  @override
  MemberModel? getMember() => null;

  @override
  List<MemberCollectionInfo>? getMemberCollectionInfo() => null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
