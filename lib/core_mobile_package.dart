import 'core_package.dart';

CorePackage getCorePackage() => CoreMobilePackage();

class CoreMobilePackage extends CorePackage {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreMobilePackage && runtimeType == other.runtimeType;

  @override
  int get hashCode => subscription.hashCode ^ statePRIVILEGE.hashCode;
}
