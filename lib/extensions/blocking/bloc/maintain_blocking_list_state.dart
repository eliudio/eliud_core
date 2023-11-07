import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/blocking_model.dart';

import '../../../model/member_public_info_model.dart';

abstract class MaintainBlockingListState extends Equatable {
  const MaintainBlockingListState();

  @override
  List<Object?> get props => [];
}

class MaintainBlockingListLoading extends MaintainBlockingListState {}

class BlockedMember {
  BlockingModel blockingModel;
  MemberPublicInfoModel memberPublicInfoModel;

  BlockedMember(
      {required this.blockingModel, required this.memberPublicInfoModel});

  @override
  bool operator ==(Object other) =>
      other is BlockedMember &&
      runtimeType == other.runtimeType &&
      blockingModel == other.blockingModel &&
      memberPublicInfoModel == other.memberPublicInfoModel;

  List<Object?> get props => [blockingModel, memberPublicInfoModel];

  @override
  String toString() => 'BlockedMember { '
      'blockingModel: $blockingModel, '
      'memberPublicInfoModel: $memberPublicInfoModel '
      '}';

  @override
  int get hashCode => blockingModel.hashCode ^ memberPublicInfoModel.hashCode;
}

class MaintainBlockingListLoaded extends MaintainBlockingListState {
  final List<BlockedMember> values;
  final bool? mightHaveMore;

  const MaintainBlockingListLoaded(
      {this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'BlockingListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is MaintainBlockingListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class MaintainBlockingNotLoaded extends MaintainBlockingListState {}
