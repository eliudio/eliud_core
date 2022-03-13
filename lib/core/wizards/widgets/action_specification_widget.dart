import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/core/blocs/access/access_event.dart';
import 'package:eliud_core/core/wizards/registry/action_specification.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/frontend/has_container.dart';
import 'package:eliud_core/style/frontend/has_dialog.dart';
import 'package:eliud_core/style/frontend/has_dialog_field.dart';
import 'package:eliud_core/style/frontend/has_divider.dart';
import 'package:eliud_core/style/frontend/has_list_tile.dart';
import 'package:eliud_core/style/frontend/has_progress_indicator.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/screen_size.dart';
import 'package:eliud_core/tools/widgets/header_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionSpecificationWidget extends StatefulWidget {
  final AppModel app;
  final String label;
  final bool enabled;
  final ActionSpecification actionSpecification;

  ActionSpecificationWidget({
    Key? key,
    required this.app,
    required this.label,
    required this.enabled,
    required this.actionSpecification,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ActionSpecificationWidgetState();
  }
}

class _ActionSpecificationWidgetState extends State<ActionSpecificationWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          h4(widget.app, context, widget.label),
          checkboxListTile(
              widget.app,
              context,
              'AppBar',
              widget.actionSpecification.availableInAppBar,
              widget.enabled
                  ? (value) {
                      setState(() {
                        widget.actionSpecification.availableInAppBar =
                            value ?? false;
                      });
                    }
                  : null),
          checkboxListTile(
              widget.app,
              context,
              'Home menu',
              widget.actionSpecification.availableInHomeMenu,
              widget.enabled
                  ? (value) {
                      setState(() {
                        widget.actionSpecification.availableInHomeMenu =
                            value ?? false;
                      });
                    }
                  : null),
          checkboxListTile(
              widget.app,
              context,
              'Left drawer',
              widget.actionSpecification.availableInLeftDrawer,
              widget.enabled
                  ? (value) {
                      setState(() {
                        widget.actionSpecification.availableInLeftDrawer =
                            value ?? false;
                      });
                    }
                  : null),
          checkboxListTile(
              widget.app,
              context,
              'Right drawer',
              widget.actionSpecification.availableInRightDrawer,
              widget.enabled
                  ? (value) {
                      setState(() {
                        widget.actionSpecification.availableInRightDrawer =
                            value ?? false;
                      });
                    }
                  : null),
          checkboxListTile(
              widget.app,
              context,
              'Available (not through menu)',
              widget.actionSpecification.available,
              widget.enabled
                  ? (value) {
                      setState(() {
                        widget.actionSpecification.available = value ?? false;
                      });
                    }
                  : null),
        ]);
  }
}
