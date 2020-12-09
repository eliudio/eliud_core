import 'package:eliud_core/model/internal_component.dart';
import 'package:flutter/cupertino.dart';

// base for all ComponentsConstructors and used to create a component of that kind
abstract class ComponentConstructor {
  Widget createNew({String id, Map<String, Object> parameters});
}

// interface for the DropDownFactories to be able to find out if a factory supports a specific component with id specified.
abstract class ComponentDropDown extends ComponentConstructor {
  bool supports(String id);

  @override
  Widget createNew({String id, Map<String, Object> parameters, String value, DropdownButtonChanged trigger, bool optional});
}