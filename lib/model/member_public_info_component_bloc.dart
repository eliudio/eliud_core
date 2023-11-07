/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/member_public_info_component_event.dart';
import 'package:eliud_core/model/member_public_info_component_state.dart';
import 'package:eliud_core/model/member_public_info_repository.dart';

class MemberPublicInfoComponentBloc extends Bloc<MemberPublicInfoComponentEvent,
    MemberPublicInfoComponentState> {
  final MemberPublicInfoRepository? memberPublicInfoRepository;
  StreamSubscription? _memberPublicInfoSubscription;

  void _mapLoadMemberPublicInfoComponentUpdateToState(String documentId) {
    _memberPublicInfoSubscription?.cancel();
    _memberPublicInfoSubscription =
        memberPublicInfoRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(MemberPublicInfoComponentUpdated(value: value));
      }
    });
  }

  MemberPublicInfoComponentBloc({this.memberPublicInfoRepository})
      : super(MemberPublicInfoComponentUninitialized()) {
    on<FetchMemberPublicInfoComponent>((event, emit) {
      _mapLoadMemberPublicInfoComponentUpdateToState(event.id!);
    });
    on<MemberPublicInfoComponentUpdated>((event, emit) {
      emit(MemberPublicInfoComponentLoaded(value: event.value));
    });
  }

  @override
  Future<void> close() {
    _memberPublicInfoSubscription?.cancel();
    return super.close();
  }
}
