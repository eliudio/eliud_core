import 'package:flutter/material.dart';

abstract class HasContainer {
  // Format a topic, e.g. a post in a box / container
  Widget topicContainer(BuildContext context, {required List<Widget> children, DecorationImage? image});

  // Format an action, e.g. a button, icon, combobox in a container
  Widget actionContainer(BuildContext context, {required Widget child});
}
