import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/pos_size_model.dart';
import 'package:eliud_core/model/public_medium_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';
import 'package:eliud_core/tools/random.dart';
import 'package:eliud_core/tools/repository_base.dart';

import 'ext_editor_base_event.dart';
import 'ext_editor_base_state.dart';

abstract class ExtEditorBaseBloc<T, U>
    extends Bloc<ExtEditorBaseEvent<T>, ExtEditorBaseState<T>> {
  final String appId;
  final RepositoryBase<T> repository;
  final EditorFeedback feedback;

  ExtEditorBaseBloc(this.appId, this.repository, this.feedback)
      : super(ExtEditorBaseUninitialised());

  T newInstance(StorageConditionsModel conditions);
  List<U> copyOf(List<U> ts);
  T setDefaultValues(T t, StorageConditionsModel conditions);
  T addItem(T model, U newItem);
  T updateItem(T model, U oldItem, U newItem);
  T deleteItem(T model, U deleteItem);

  @override
  Stream<ExtEditorBaseState<T>> mapEventToState(
      ExtEditorBaseEvent event) async* {
    if (event is ExtEditorBaseInitialise) {
      // retrieve the model, as it was retrieved without links
      var modelWithLinks = await repository
          .get(event.model.documentID);
      if (modelWithLinks == null) {
        modelWithLinks = newInstance(StorageConditionsModel(
            privilegeLevelRequired:
            PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
        );
      } else {
        modelWithLinks =
            setDefaultValues(modelWithLinks, StorageConditionsModel(
                privilegeLevelRequired:
                PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple));
      }
      yield ExtEditorBaseInitialised(
        model: modelWithLinks!,
      );
    } else if (state is ExtEditorBaseInitialised) {
      var theState = state as ExtEditorBaseInitialised;
      if (event is SelectForEditEvent) {
        yield ExtEditorBaseInitialised(
            model: theState.model, currentEdit: event.item);
      } else if (event is AddItemEvent) {
        yield ExtEditorBaseInitialised(
            model: addItem(theState.model, event.itemModel),
            currentEdit: theState.currentEdit);
      } else if (event is UpdateItemEvent) {
          yield ExtEditorBaseInitialised(
              model: updateItem(theState.model, event.oldItem, event.newItem),
              currentEdit: event.newItem);
      } else if (event is DeleteItemEvent) {
        yield ExtEditorBaseInitialised(
            model: deleteItem(theState.model, event.itemModel));
      } else if (event is MoveEvent) {
        var items = theState.model.items!;
        var newListedItems = copyOf(items);
        var index = items.indexOf(event.item);
        if (index != -1) {
          if (event.isUp) {
            if (index > 0) {
              var old = newListedItems[index - 1];
              newListedItems[index - 1] = newListedItems[index];
              newListedItems[index] = old;
              yield ExtEditorBaseInitialised(
                  model: theState.model.copyWith(items: newListedItems), currentEdit: theState.currentEdit);
            }
          } else {
            if (index < newListedItems.length - 1) {
              var old = newListedItems[index + 1];
              newListedItems[index + 1] = newListedItems[index];
              newListedItems[index] = old;
              yield ExtEditorBaseInitialised(
                  model: theState.model.copyWith(items: newListedItems), currentEdit: theState.currentEdit);
            }
          }
        }
      }
    }
  }

  Future<void> save(ExtEditorBaseApplyChanges event) async {
    if (state is ExtEditorBaseInitialised) {
      var theState = state as ExtEditorBaseInitialised;
      var newModel = theState.model;
      if (await repository
              .get(newModel.documentID!) ==
          null) {
        await repository.add(newModel);
      } else {
        await repository.update(newModel);
      }
      feedback(true);
    }
  }
}
