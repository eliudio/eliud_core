abstract class ModelBase {
  late String documentID;
  ModelBase copyWith();
  Future<String> toRichJsonString({String? appId});
}

abstract class WithAppId {
  late String appId;
}