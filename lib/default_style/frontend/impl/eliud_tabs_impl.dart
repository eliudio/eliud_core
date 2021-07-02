import 'package:eliud_core/style/frontend/has_tabs.dart';
import 'package:eliud_core/style/frontend/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import '../../eliud_style.dart';

class EliudTabsImpl
    implements HasTabs {
  final EliudStyle _eliudStyle;

  EliudTabsImpl(this._eliudStyle);

  @override
  Widget tabBar(BuildContext context, {required List<String> items, required TabController tabController}) {
    var tabItems = <TabItem>[];
    for (var item in items) {
      tabItems!.add(TabItem(color: Colors.black12, title: _eliudStyle.frontEndStyle().textStyle().text(context,
        item,
      )));
    }
    return ColorfulTabBar(
      tabs: tabItems!,
      controller: tabController,
    );
  }

}
