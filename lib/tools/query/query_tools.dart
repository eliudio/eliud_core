import 'package:eliud_core/model/member_model.dart';

class EliudQueryCondition {
  final dynamic field;
  final dynamic isEqualTo;
  final dynamic isLessThan;
  final dynamic isLessThanOrEqualTo;
  final dynamic isGreaterThan;
  final dynamic isGreaterThanOrEqualTo;
  final dynamic arrayContains;
  final List<dynamic> arrayContainsAny;
  final List<dynamic> whereIn;
  final bool isNull;

  EliudQueryCondition(this.field, {this.isEqualTo, this.isLessThan, this.isLessThanOrEqualTo, this.isGreaterThan, this.isGreaterThanOrEqualTo,
      this.arrayContains,
      this.arrayContainsAny,
      this.whereIn,
      this.isNull,});
}

class EliudQuery {
  final List<EliudQueryCondition> conditions = [];

  EliudQuery({List<EliudQueryCondition> theConditions}) {
    withConditions(theConditions);
  }

  EliudQuery withCondition(EliudQueryCondition condition) {
    if (condition != null) {
      conditions.add(condition);
    }
    return this;
  }

  EliudQuery withConditions(List<EliudQueryCondition> theConditions) {
    if (theConditions != null) {
      conditions.addAll(theConditions);
    }
    return this;
  }

  EliudQuery withMemberLimittedCondition(String currentMember) {
    conditions.add(EliudQueryCondition(
        'readAccess', arrayContainsAny: ((currentMember == null) || (currentMember == "")) ? ['PUBLIC'] : [currentMember, 'PUBLIC']
    ));
    return this;
  }

  static EliudQuery ensureQueryAvailable(EliudQuery query) {
    if (query == null) return EliudQuery();
    return query;
  }
}