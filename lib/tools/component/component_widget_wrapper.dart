// this WidgetWrapper can be registered onto the registry and can be used as a widget wrapper for a page
// the page will wrap all it's components inside this widget. This can for example be of use when
// you would want to use 1 bloc for several components on a page, preventing a bloc-delay for each component
import 'package:eliud_core/core/tools/component_info.dart';
import 'package:flutter/cupertino.dart';

abstract class ComponentWidgetWrapper {
  Widget wrapWidget(BuildContext context, ComponentInfo componentInfo);
}
