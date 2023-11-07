import 'package:eliud_core/core/wizards/registry/action_specification.dart';
import 'package:eliud_core/core/wizards/registry/registry.dart';

enum JoinPaymentType { manual, card }

class JoinActionSpecifications extends ActionSpecification {
  final JoinPaymentType paymentType;

  JoinActionSpecifications({
    required this.paymentType,
    required super.requiresAccessToLocalFileSystem,
    required super.availableInLeftDrawer,
    required super.availableInRightDrawer,
    required super.availableInAppBar,
    required super.availableInHomeMenu,
    required super.available,
  });
}

class JoinActionSpecificationParameters extends NewAppWizardParameters {
  late JoinActionSpecifications joinActionSpecifications;

  JoinActionSpecificationParameters(
      {required bool requiresAccessToLocalFileSystem,
      required bool availableInLeftDrawer,
      required bool availableInRightDrawer,
      required bool availableInAppBar,
      required bool availableInHomeMenu,
      required bool available,
      required JoinPaymentType paymentType}) {
    joinActionSpecifications = JoinActionSpecifications(
      requiresAccessToLocalFileSystem: requiresAccessToLocalFileSystem,
      availableInLeftDrawer: availableInLeftDrawer,
      availableInRightDrawer: availableInRightDrawer,
      availableInAppBar: availableInAppBar,
      availableInHomeMenu: availableInHomeMenu,
      available: available,
      paymentType: paymentType,
    );
  }
}
