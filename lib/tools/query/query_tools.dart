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
  final List<EliudQueryCondition> conditions;

  EliudQuery({this.conditions});
}
