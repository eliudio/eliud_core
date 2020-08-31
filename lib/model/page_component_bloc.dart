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

class PageBloc extends Bloc<PageEvent, PageState> {
  final PageRepository pageRepository;

  PageBloc({ this.pageRepository }): super(PageUninitialized());
  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    final currentState = state;
    if (event is FetchPage) {
      try {
        if (currentState is PageUninitialized) {
          final PageModel model = await _fetchPage(event.id);

          if (model != null) {
            yield PageLoaded(value: model);
          } else {
            String id = event.id;
            yield PageError(message: "Page with id = '$id' not found");
          }
          return;
        }
      } catch (_) {
        yield PageError(message: "Unknown error whilst retrieving Page");
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


