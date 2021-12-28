import 'package:equatable/equatable.dart';
import 'package:eliud_core/model/page_model.dart';

abstract class CurrentPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCurrentPage extends CurrentPageEvent {
  final String? id;

  FetchCurrentPage({ this.id });
}

class CurrentPageUpdated extends CurrentPageEvent {
  final PageModel value;

  CurrentPageUpdated({ required this.value });
}


