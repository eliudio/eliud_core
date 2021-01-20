/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 image_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:eliud_core/model/image_repository.dart';
import 'package:eliud_core/model/image_list_event.dart';
import 'package:eliud_core/model/image_list_state.dart';
import 'package:eliud_core/tools/query/query_tools.dart';


const _imageLimit = 5;

class ImageListBloc extends Bloc<ImageListEvent, ImageListState> {
  final ImageRepository _imageRepository;
  StreamSubscription _imagesListSubscription;
  final EliudQuery eliudQuery;
  int pages = 1;
  final bool paged;
  final String orderBy;
  final bool descending;
  final bool detailed;

  ImageListBloc({this.paged, this.orderBy, this.descending, this.detailed, this.eliudQuery, @required ImageRepository imageRepository})
      : assert(imageRepository != null),
        _imageRepository = imageRepository,
        super(ImageListLoading());

  Stream<ImageListState> _mapLoadImageListToState() async* {
    int amountNow =  (state is ImageListLoaded) ? (state as ImageListLoaded).values.length : 0;
    _imagesListSubscription?.cancel();
    _imagesListSubscription = _imageRepository.listen(
          (list) => add(ImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
      orderBy: orderBy,
      descending: descending,
      eliudQuery: eliudQuery,
      limit: ((paged != null) && (paged)) ? pages * _imageLimit : null
    );
  }

  Stream<ImageListState> _mapLoadImageListWithDetailsToState() async* {
    int amountNow =  (state is ImageListLoaded) ? (state as ImageListLoaded).values.length : 0;
    _imagesListSubscription?.cancel();
    _imagesListSubscription = _imageRepository.listenWithDetails(
            (list) => add(ImageListUpdated(value: list, mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && (paged)) ? pages * _imageLimit : null
    );
  }

  Stream<ImageListState> _mapAddImageListToState(AddImageList event) async* {
    _imageRepository.add(event.value);
  }

  Stream<ImageListState> _mapUpdateImageListToState(UpdateImageList event) async* {
    _imageRepository.update(event.value);
  }

  Stream<ImageListState> _mapDeleteImageListToState(DeleteImageList event) async* {
    _imageRepository.delete(event.value);
  }

  Stream<ImageListState> _mapImageListUpdatedToState(
      ImageListUpdated event) async* {
    yield ImageListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);
  }

  @override
  Stream<ImageListState> mapEventToState(ImageListEvent event) async* {
    if (event is LoadImageList) {
      if ((detailed == null) || (!detailed)) {
        yield* _mapLoadImageListToState();
      } else {
        yield* _mapLoadImageListWithDetailsToState();
      }
    }
    if (event is NewPage) {
      pages = pages + 1; // it doesn't matter so much if we increase pages beyond the end
      yield* _mapLoadImageListWithDetailsToState();
    } else if (event is AddImageList) {
      yield* _mapAddImageListToState(event);
    } else if (event is UpdateImageList) {
      yield* _mapUpdateImageListToState(event);
    } else if (event is DeleteImageList) {
      yield* _mapDeleteImageListToState(event);
    } else if (event is ImageListUpdated) {
      yield* _mapImageListUpdatedToState(event);
    }
  }

  @override
  Future<void> close() {
    _imagesListSubscription?.cancel();
    return super.close();
  }
}


