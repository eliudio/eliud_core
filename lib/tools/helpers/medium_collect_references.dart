import '../../core/base/model_base.dart';
import '../../core/base/repository_base.dart';

Future<List<ModelReference>> mediumCollectReferences(
    {String? appId,
    required String? relatedMediumId,
    required RepositoryBase repo,
    required String packageName,
    required String id}) async {
  List<ModelReference> referencesCollector = [];
  var searchThisId = relatedMediumId;
  while (searchThisId != null) {
    var newRelated = await repo.get(searchThisId);
    if (newRelated != null) {
      referencesCollector.add(ModelReference(packageName, id, newRelated));
      searchThisId = newRelated.relatedMediumId;
    } else {
      break;
    }
  }
  return referencesCollector;
}
