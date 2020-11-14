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

class PageComponentBloc extends Bloc<PageComponentEvent, PageComponentState> {
  final PageRepository pageRepository;

  PageComponentBloc({ this.pageRepository }): super(PageComponentUninitialized());
  @override
  Stream<PageComponentState> mapEventToState(PageComponentEvent event) async* {
    final currentState = state;
    if (event is FetchPageComponent) {
      try {
        if (currentState is PageComponentUninitialized) {
          final PageModel model = await _fetchPage(event.id);

          if (model != null) {
            yield PageComponentLoaded(value: model);
          } else {
            String id = event.id;
            yield PageComponentError(message: "Page with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PageComponentError(message: "Unknown error whilst retrieving Page");
      }
    }
  }

  Future<PageModel> _fetchPage(String id) async {
    return pageRepository.get(id);
  }

  @override
  Future<void> close() {
    return super.close();
  }

}


