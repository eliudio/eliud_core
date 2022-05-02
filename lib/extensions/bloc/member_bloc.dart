import 'package:bloc/bloc.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_event.dart';
import 'package:eliud_core/core/editor/ext_editor_base_bloc/ext_editor_base_state.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/repository_base.dart';

import '../../model/member_model.dart';
import '../../model/member_subscription_model.dart';


class MemberBloc extends Bloc<ExtEditorBaseEvent<MemberModel>, ExtEditorBaseState<MemberModel>> {
//class MemberBloc extends ExtEditorBaseBloc<MemberModel, MemberSubscriptionModel> {
  final String appId;

  MemberBloc(this.appId)
      : super(ExtEditorBaseUninitialised());


  @override
  Stream<ExtEditorBaseState<MemberModel>> mapEventToState(
      ExtEditorBaseEvent event) async* {
    if (event is ExtEditorBaseInitialise) {
      yield ExtEditorBaseInitialised(
        model: event.model.copyWith(),
      );
    } else if (state is ExtEditorBaseInitialised) {
      var theState = state as ExtEditorBaseInitialised;
      var model = theState.model as MemberModel;
      if (event is AddItemEvent) {
        List<MemberSubscriptionModel> newItems = model.subscriptions == null
            ? []
            : model.subscriptions!.map((e) => e).toList();
        newItems.add(event.itemModel);
        var newModel = model.copyWith(subscriptions:  newItems);
        yield ExtEditorBaseInitialised(
            model: newModel,
            currentEdit: theState.currentEdit);
      } else if (event is UpdateItemEvent) {
        List<MemberSubscriptionModel> currentItems = model.subscriptions == null
            ? []
            : model.subscriptions!;
        var index = currentItems.indexOf(event.oldItem);
        if (index != -1) {
          var newItems = currentItems.map((e) => e).toList();
          newItems[index] = event.newItem;
          var newModel = model.copyWith(subscriptions: newItems);
          yield ExtEditorBaseInitialised(
              model: newModel);
        } else {
          throw Exception("Could not find item");
        }
      } else if (event is DeleteItemEvent) {
        var newItems = <MemberSubscriptionModel>[];
        for (var item in model.subscriptions!) {
          if (item != event.itemModel) {
            newItems.add(item);
          }
        }
        var newModel = model.copyWith(subscriptions: newItems);
        yield ExtEditorBaseInitialised(
            model: newModel);
      }
    }
  }

  Future<void> save(MemberModel member) {
    return memberRepository()!.update(member);
  }
}
