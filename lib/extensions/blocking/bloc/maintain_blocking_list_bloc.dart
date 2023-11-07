import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/blocking_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import '../../../core/blocs/access/state/logged_in.dart';
import '../../../model/abstract_repository_singleton.dart';
import 'maintain_blocking_list_event.dart';
import 'maintain_blocking_list_state.dart';

class MaintainBlockingListBloc
    extends Bloc<MaintainBlockingListEvent, MaintainBlockingListState> {
  StreamSubscription? _blockingsListSubscription;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int blockingLimit;
  final String appId;
  final String memberId;
  final LoggedIn? loggedIn;

  MaintainBlockingListBloc(
      {required this.memberId,
      required this.loggedIn,
      required this.appId,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.blockingLimit = 5})
      : super(MaintainBlockingListLoading()) {
    on<LoadMaintainBlockingList>((event, emit) {
      _mapLoadBlockingListWithDetailsToState();
    });

    on<MaintainBlockingNewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadBlockingListWithDetailsToState();
    });

    on<AddMaintainBlockingList>((event, emit) async {
      await _mapAddBlockingListToState(event);
    });

    on<UpdateMaintainBlockingList>((event, emit) async {
      await _mapUpdateBlockingListToState(event);
    });

    on<DeleteMaintainBlockingList>((event, emit) async {
      await _mapDeleteBlockingListToState(event);
    });

    on<MaintainBlockingListUpdated>((event, emit) {
      emit(_mapBlockingListUpdatedToState(event));
    });
  }

  Future<void> _mapLoadBlockingListWithDetailsToState() async {
    int amountNow = (state is BlockingListLoaded)
        ? (state as BlockingListLoaded).values!.length
        : 0;
    _blockingsListSubscription?.cancel();
    _blockingsListSubscription = blockingRepository(appId: appId)!
        .listenWithDetails((list) async {
      List<BlockedMember> newList = [];
      for (var e in list) {
        if (e != null) {
          var memberPublicInfoModel =
              await memberPublicInfoRepository()!.get(e.memberBeingBlocked);
          if (memberPublicInfoModel != null) {
            BlockedMember bm = BlockedMember(
                blockingModel: e, memberPublicInfoModel: memberPublicInfoModel);
            newList.add(bm);
          }
        }
      }
      add(MaintainBlockingListUpdated(
          value: newList, mightHaveMore: amountNow != list.length));
    },
            orderBy: orderBy,
            descending: descending,
            eliudQuery: getEliudQuery(),
            limit: ((paged != null) && paged!) ? pages * blockingLimit : null);
  }

  EliudQuery getEliudQuery() {
    return EliudQuery(theConditions: [
      EliudQueryCondition('memberBlocking', isEqualTo: memberId),
    ]);
  }

  Future<void> _mapAddBlockingListToState(AddMaintainBlockingList event) async {
    var value = event.value;
    await blockingRepository(appId: appId)!.add(value);
  }

  Future<void> _mapUpdateBlockingListToState(
      UpdateMaintainBlockingList event) async {
    var value = event.value;
    await blockingRepository(appId: appId)!.update(value);
  }

  Future<void> _mapDeleteBlockingListToState(
      DeleteMaintainBlockingList event) async {
    var value = event.value;
    if (value.blockingModel.memberBeingBlocked != null) {
      if (loggedIn != null) {
        loggedIn!
            .unRegisterBlockedMember(value.blockingModel.memberBeingBlocked!);
      }
    }
  }

  MaintainBlockingListLoaded _mapBlockingListUpdatedToState(
          MaintainBlockingListUpdated event) =>
      MaintainBlockingListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _blockingsListSubscription?.cancel();
    return super.close();
  }
}
