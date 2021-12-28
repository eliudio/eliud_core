import 'package:eliud_core/model/app_model.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/page_model.dart';

abstract class CurrentPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCurrentPage extends CurrentPageEvent {
  final String appId;
  final String pageId;

  FetchCurrentPage({ required this.appId, required this.pageId });
}

class CurrentPageUpdated extends CurrentPageEvent {
  final PageModel page;

  CurrentPageUpdated({ required this.page });
}

class CurrentAppUpdated extends CurrentPageEvent {
  final AppModel app;

  CurrentAppUpdated({ required this.app});
}

