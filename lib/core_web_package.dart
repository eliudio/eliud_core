import 'core_package.dart';

class CoreWebPackage extends CorePackage {
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
          other is CoreWebPackage &&
              runtimeType == other.runtimeType;
}
