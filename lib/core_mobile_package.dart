import 'core_package.dart';

class CoreMobilePackage extends CorePackage {
  @override
  void init() {
    super.init();
    // initialise the platform... nothing now
  }

  @override
  List<Object?> get props => [
    stateMemberModel,
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is CoreMobilePackage &&
              runtimeType == other.runtimeType &&
              stateMemberModel == other.stateMemberModel;

}
