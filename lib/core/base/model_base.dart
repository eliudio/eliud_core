import '../../model/app_model.dart';
import 'entity_base.dart';

abstract class ModelBase {
  late String documentID;
  ModelBase copyWith();
/*
  Future<Map<String, dynamic>> toRichMap({required String appId});
  Future<void> processRichMap({required AppModel app, required String ownerId, required Map<String, dynamic> document});
*/
  EntityBase toEntity({String? appId, List<ModelBase>? referencesCollector});
}

abstract class WithAppId {
  late String appId;
}