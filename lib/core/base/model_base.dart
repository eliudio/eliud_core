abstract class ModelBase {
  late String documentID;
  ModelBase copyWith();
  String toJsonString({String? appId});
}

abstract class WithAppId {
  late String appId;
}