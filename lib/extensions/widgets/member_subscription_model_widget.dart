import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/member_subscription_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_container.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/helper_widgets/header_widget.dart';

typedef MemberSubscriptionModelCallback = void Function(
    MemberSubscriptionModel documentItemModel);

class MemberSubscriptionModelWidget extends StatefulWidget {
  final bool create;
  final double widgetWidth;
  final double widgetHeight;
  final AppModel app;
  final MemberSubscriptionModel documentItemModel;
  final MemberSubscriptionModelCallback documentItemModelCallback;

  MemberSubscriptionModelWidget._({
    required this.app,
    required this.create,
    required this.widgetWidth,
    required this.widgetHeight,
    required this.documentItemModel,
    required this.documentItemModelCallback,
  });

  @override
  State<StatefulWidget> createState() {
    return _MemberSubscriptionModelWidgetState();
  }

  static Widget getIt(
    BuildContext context,
    AppModel app,
    bool create,
    double widgetWidth,
    double widgetHeight,
    MemberSubscriptionModel documentItemModel,
    MemberSubscriptionModelCallback documentItemModelCallback,
  ) {
    var copyOf = documentItemModel.copyWith();
    return MemberSubscriptionModelWidget._(
      app: app,
      create: create,
      widgetWidth: widgetWidth,
      widgetHeight: widgetHeight,
      documentItemModel: copyOf,
      documentItemModelCallback: documentItemModelCallback,
    );
  }
}

class _MemberSubscriptionModelWidgetState
    extends State<MemberSubscriptionModelWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      HeaderWidget(
        app: widget.app,
        cancelAction: () async {
          return true;
        },
        okAction: () async {
          widget.documentItemModelCallback(widget.documentItemModel);
          return true;
        },
        title: 'Link',
      ),
      divider(widget.app, context),
      topicContainer(widget.app, context,
          title: 'General',
          collapsible: true,
          collapsed: true,
          children: [
            getListTile(context, widget.app,
                leading: Icon(Icons.vpn_key),
                title: text(
                    widget.app, context, widget.documentItemModel.documentID)),
          ]),
    ]);
  }
}
