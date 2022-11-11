import 'core_package.dart';

CorePackage getCorePackage() => CoreMobilePackage();

class CoreMobilePackage extends CorePackage {
  @override
  void init() {
    super.init();
    // initialise the platform... nothing now
  }

  @override
  List<Object?> get props => [
  ];

  @override
  bool operator == (Object other) =>
      identical(this, other) ||
          other is CoreMobilePackage &&
              runtimeType == other.runtimeType;


}
