import 'package:bloc/bloc.dart';
import 'package:eliud_core_model/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core_model/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core_model/model/member_model.dart';
import 'package:eliud_core_model/model/member_subscription_model.dart';
import 'package:eliud_core_model/tools/main_abstract_repository_singleton.dart';

class MemberBloc extends Bloc<ExtEditorBaseEvent<MemberModel>,
    ExtEditorBaseState<MemberModel>> {
//class MemberBloc extends ExtEditorBaseBloc<MemberModel, MemberSubscriptionModel> {
  final String appId;

  MemberBloc(this.appId) : super(ExtEditorBaseUninitialised()) {
    on<ExtEditorBaseInitialise<MemberModel>>((event, emit) {
      emit(ExtEditorBaseInitialised(
        model: event.model.copyWith(),
      ));
    });

    on<AddItemEvent<MemberModel, MemberSubscriptionModel>>((event, emit) {
      if (state is ExtEditorBaseInitialised) {
        var theState = state as ExtEditorBaseInitialised;
        var model = theState.model as MemberModel;
        List<MemberSubscriptionModel> newItems = model.subscriptions == null
            ? []
            : model.subscriptions!.map((e) => e).toList();
        newItems.add(event.itemModel);
        var newModel = model.copyWith(subscriptions: newItems);
        emit(ExtEditorBaseInitialised(
            model: newModel, currentEdit: theState.currentEdit));
      }
    });

    on<UpdateItemEvent<MemberModel, MemberSubscriptionModel>>((event, emit) {
      if (state is ExtEditorBaseInitialised) {
        var theState = state as ExtEditorBaseInitialised;
        var model = theState.model as MemberModel;
        List<MemberSubscriptionModel> currentItems =
            model.subscriptions == null ? [] : model.subscriptions!;
        var index = currentItems.indexOf(event.oldItem);
        if (index != -1) {
          var newItems = currentItems.map((e) => e).toList();
          newItems[index] = event.newItem;
          var newModel = model.copyWith(subscriptions: newItems);
          emit(ExtEditorBaseInitialised(model: newModel));
        } else {
          throw Exception("Could not find item");
        }
      }
    });

    on<DeleteItemEvent<MemberModel, MemberSubscriptionModel>>((event, emit) {
      if (state is ExtEditorBaseInitialised) {
        var theState = state as ExtEditorBaseInitialised;
        var model = theState.model as MemberModel;
        var newItems = <MemberSubscriptionModel>[];
        for (var item in model.subscriptions!) {
          if (item != event.itemModel) {
            newItems.add(item);
          }
        }
        var newModel = model.copyWith(subscriptions: newItems);
        emit(ExtEditorBaseInitialised(model: newModel));
      }
    });
  }

  Future<void> save(MemberModel member) {
    return memberRepository()!.update(member);
  }
}
