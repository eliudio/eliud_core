import '../../model/app_model.dart';
import 'entity_base.dart';

abstract class ModelBase {
  late String documentID;
  ModelBase copyWith();
/*
  Future<Map<String, dynamic>> toRichMap({required String appId});
  Future<void> processRichMap({required AppModel app, required String ownerId, required Map<String, dynamic> document});
*/
  EntityBase toEntity(
      {String? appId, Set<ModelReference>? referencesCollector});
}

abstract class WithAppId {
  late String appId;
}

class ModelReference {
  final String packageName;
  final String componentName;
  final ModelBase referenced;

  ModelReference(this.packageName, this.componentName, this.referenced);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelReference &&
          runtimeType == other.runtimeType &&
          packageName == other.packageName &&
          componentName == other.componentName &&
          referenced == other.referenced;
}
