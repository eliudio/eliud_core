import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/package/package.dart';
import 'package:equatable/equatable.dart';

import 'access_state.dart';

class UndeterminedAccessState extends AccessState {
  UndeterminedAccessState();

  @override
  List<Object> get props => [];

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
  bool operator == (Object other) =>
      identical(this, other) ||
          other is UndeterminedAccessState &&
              runtimeType == other.runtimeType;
}