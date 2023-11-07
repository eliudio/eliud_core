import 'core_package.dart';

CorePackage getCorePackage() => CoreWebPackage();

class CoreWebPackage extends CorePackage {
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoreWebPackage && runtimeType == other.runtimeType;

  @override
  int get hashCode => subscription.hashCode ^ statePRIVILEGE.hashCode;
}
