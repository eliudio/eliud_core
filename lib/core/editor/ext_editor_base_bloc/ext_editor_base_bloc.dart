import 'package:bloc/bloc.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/tools/component/component_spec.dart';

import '../../base/model_base.dart';
import '../../base/repository_base.dart';
import 'ext_editor_base_event.dart';
import 'ext_editor_base_state.dart';

abstract class ExtEditorBaseBloc<T extends ModelBase, U, V>
    extends Bloc<ExtEditorBaseEvent<T>, ExtEditorBaseState<T>> {
  final String appId;
  final RepositoryBase<T, V> repository;
  final EditorFeedback? feedback;

  T newInstance(StorageConditionsModel conditions);
  List<U> copyOf(List<U> ts);
  T setDefaultValues(T t, StorageConditionsModel conditions);
  T addItem(T model, U newItem);
  T updateItem(T model, U oldItem, U newItem);
  T deleteItem(T model, U deleteItem);

  ExtEditorBaseBloc(this.appId, this.repository, this.feedback)
      : super(ExtEditorBaseUninitialised()) {
    on<ExtEditorBaseInitialise<T>>((event, emit) async {
      // retrieve the model, as it was retrieved without links
      if (event.reretrieveModel) {
        var modelWithLinks = await repository.get(event.model.documentID);
        if (modelWithLinks == null) {
          modelWithLinks = newInstance(
            StorageConditionsModel(
                privilegeLevelRequired:
                PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple),
          );
        } else {
          modelWithLinks = setDefaultValues(
              modelWithLinks,
              StorageConditionsModel(
                  privilegeLevelRequired:
                  PrivilegeLevelRequiredSimple.NoPrivilegeRequiredSimple));
        }
        emit(ExtEditorBaseInitialised(
          model: modelWithLinks,
        ));
      } else {
        emit(ExtEditorBaseInitialised(
          model: event.model,
        ));
      }
    });
    on<SelectForEditEvent<T, U>>((event, emit) {
      var theState = state as ExtEditorBaseInitialised;
      emit(ExtEditorBaseInitialised(
          model: theState.model, currentEdit: event.item));
    });
    on<AddItemEvent<T, U>>((event, emit) async {
      var theState = state as ExtEditorBaseInitialised;
      emit(ExtEditorBaseInitialised(
          model: addItem(theState.model, event.itemModel),
          currentEdit: theState.currentEdit));
    });
    on<UpdateItemEvent<T, U>>((event, emit) async {
      var theState = state as ExtEditorBaseInitialised;
      emit(ExtEditorBaseInitialised(
          model: updateItem(theState.model, event.oldItem, event.newItem),
          currentEdit: event.newItem));
    });
    on<DeleteItemEvent<T, U>>((event, emit) async {
      var theState = state as ExtEditorBaseInitialised;
      emit(ExtEditorBaseInitialised(
          model: deleteItem(theState.model, event.itemModel)));
    });
    on<MoveEvent<T, U>>((event, emit) async {
      var theState = state as ExtEditorBaseInitialised;
      var items = theState.model.items!;
      var newListedItems = copyOf(items);
      var index = items.indexOf(event.item);
      if (index != -1) {
        if (event.isUp) {
          if (index > 0) {
            var old = newListedItems[index - 1];
            newListedItems[index - 1] = newListedItems[index];
            newListedItems[index] = old;
            emit(ExtEditorBaseInitialised(
                model: theState.model.copyWith(items: newListedItems),
                currentEdit: theState.currentEdit));
          }
        } else {
          if (index < newListedItems.length - 1) {
            var old = newListedItems[index + 1];
            newListedItems[index + 1] = newListedItems[index];
            newListedItems[index] = old;
            emit(ExtEditorBaseInitialised(
                model: theState.model.copyWith(items: newListedItems),
                currentEdit: theState.currentEdit));
          }
        }
      }
    });
  }

  Future<void> save(ExtEditorBaseApplyChanges event) async {
    if (state is ExtEditorBaseInitialised) {
      var theState = state as ExtEditorBaseInitialised;
      var newModel = theState.model;
      if (await repository.get(newModel.documentID) == null) {
        await repository.add(newModel);
      } else {
        await repository.update(newModel);
      }
      if (feedback != null) {
        feedback!(true, newModel);
      }
    }
  }
}
