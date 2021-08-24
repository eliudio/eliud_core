import 'package:eliud_core/style/frontend/has_tabs.dart';
import 'package:eliud_core/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';

class EliudTabsImpl
    implements HasTabs {
  final Style _style;

  EliudTabsImpl(this._style);

  @override
  Widget tabBar(BuildContext context, {required List<String> items, required TabController tabController}) {
    var tabItems = <TabItem>[];
    for (var item in items) {
      tabItems.add(TabItem(color: Colors.black12, title: _style.frontEndStyle().textStyle().text(context,
        item,
      )));
    }
    return ColorfulTabBar(
      tabs: tabItems,
      controller: tabController,
    );
  }

}
