import '../../model/app_model.dart';
import 'entity_base.dart';
import 'package:eliud_core/model/platform_medium_model.dart';

abstract class ModelBase {
  late String documentID;
  ModelBase copyWith();
  EntityBase toEntity({String? appId});
  Future<List<ModelReference>> collectReferences({String? appId});
}

abstract class WithAppId {
  late String appId;
}

class ModelReference {
  final String packageName;
  final String componentName;
  final ModelBase referenced;

  ModelReference(this.packageName, this.componentName, this.referenced) {
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelReference &&
          runtimeType == other.runtimeType &&
          packageName == other.packageName &&
          componentName == other.componentName &&
          referenced.documentID == other.referenced.documentID;

  String key() => packageName + "-" + componentName + "-" + referenced.documentID;
}
