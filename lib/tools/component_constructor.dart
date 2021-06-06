import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/components/util/component_info.dart';
import 'package:eliud_core/core/widgets/alert_widget.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';
import 'package:eliud_core/tools/component_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:flutter/material.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:flutter/cupertino.dart';

// base for all ComponentsConstructors and used to create a component of that kind
abstract class ComponentConstructor {
  Widget? createNew({String? id, Map<String, dynamic>? parameters});
}

// interface for the DropDownFactories to be able to find out if a factory supports a specific component with id specified.
abstract class ComponentDropDown extends ComponentConstructor {
  bool supports(String id);

  @override
  Widget? createNew({String? id, Map<String, dynamic>? parameters, String? value, DropdownButtonChanged? trigger, bool? optional});
}

// this WidgetWrapper can be registered onto the registry and can be used as a widget wrapper for a page
// the page will wrap all it's components inside this widget. This can for example be of use when
// you would want to use 1 bloc for several components on a page, preventing a bloc-delay for each component
abstract class ComponentWidgetWrapper {
  Widget wrapWidget(BuildContext context, ComponentInfo componentInfo);
}
