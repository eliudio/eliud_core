import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/material.dart';

abstract class HasTabs {
  Widget tabBar(BuildContext context, {required List<String> items, required TabController tabController});
}
