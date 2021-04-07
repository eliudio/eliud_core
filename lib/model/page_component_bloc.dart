/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_component_event.dart';
import 'package:eliud_core/model/page_component_state.dart';
import 'package:eliud_core/model/page_repository.dart';
import 'package:flutter/services.dart';


class PageComponentBloc extends Bloc<PageComponentEvent, PageComponentState> {
  final PageRepository? pageRepository;

  PageComponentBloc({ this.pageRepository }): super(PageComponentUninitialized());
  @override
  Stream<PageComponentState> mapEventToState(PageComponentEvent event) async* {
    final PageComponentState currentState = state;
    if (event is FetchPageComponent) {
      try {
        if (currentState is PageComponentUninitialized) {
          bool permissionDenied = false;
          final model = await pageRepository!.get(event.id, onError: (error) {
            // Unfortunatly the below is currently the only way we know how to identify if a document is read protected
            if ((error is PlatformException) &&  (error.message!.startsWith("PERMISSION_DENIED"))) {
              permissionDenied = true;
            }
          });
          if (permissionDenied) {
            yield PageComponentPermissionDenied();
          } else {
            if (model != null) {
              yield PageComponentLoaded(value: model);
            } else {
              String? id = event.id;
              yield PageComponentError(
                  message: "Page with id = '$id' not found");
            }
          }
          return;
        }
      } catch (_) {
        yield PageComponentError(message: "Unknown error whilst retrieving Page");
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }

}

