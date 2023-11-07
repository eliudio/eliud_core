abstract class SpecialField {}

class DocumentIdField extends SpecialField {}

class EliudQueryCondition {
  final dynamic field;
  final dynamic isEqualTo;
  final dynamic isLessThan;
  final dynamic isLessThanOrEqualTo;
  final dynamic isGreaterThan;
  final dynamic isGreaterThanOrEqualTo;
  final dynamic arrayContains;
  final List<dynamic>? arrayContainsAny;
  final List<dynamic>? whereIn;
  final bool? isNull;

  EliudQueryCondition(
    this.field, {
    this.isEqualTo,
    this.isLessThan,
    this.isLessThanOrEqualTo,
    this.isGreaterThan,
    this.isGreaterThanOrEqualTo,
    this.arrayContains,
    this.arrayContainsAny,
    this.whereIn,
    this.isNull,
  });
}

class EliudQuery {
  final List<EliudQueryCondition> conditions = [];

  EliudQuery({List<EliudQueryCondition>? theConditions}) {
    withConditions(theConditions);
  }

  EliudQuery withCondition(EliudQueryCondition condition) {
    conditions.add(condition);
    return this;
  }

  EliudQuery withConditions(List<EliudQueryCondition>? theConditions) {
    if (theConditions != null) {
      conditions.addAll(theConditions);
    }
    return this;
  }

  static EliudQuery ensureQueryAvailable(EliudQuery? query) {
    if (query == null) return EliudQuery();
    return query;
  }
}

EliudQuery getComponentSelectorQuery(int privilegeLevel, String appId) {
  return EliudQuery()
      .withCondition(
        EliudQueryCondition('conditions.privilegeLevelRequired',
            isEqualTo: privilegeLevel),
      )
      .withCondition(
        EliudQueryCondition('appId', isEqualTo: appId),
      );
}
