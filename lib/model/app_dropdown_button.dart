/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/package/packages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:eliud_core/tools/query/query_tools.dart';

import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/tools/component/update_component.dart';


import 'package:eliud_core/model/app_list_bloc.dart';
import 'package:eliud_core/model/app_list_state.dart';
import 'package:eliud_core/model/app_list_event.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/style/frontend/has_button.dart';
import 'package:eliud_core/tools/component/update_component.dart';



typedef AppChanged(String? value, int? privilegeLevel,);

class AppDropdownButtonWidget extends StatefulWidget {
  final AppModel app;
  int? privilegeLevel;
  String? value;
  final AppChanged? trigger;
  final bool? optional;

  AppDropdownButtonWidget({ required this.app, this.privilegeLevel, this.value, this.trigger, this.optional, Key? key }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppDropdownButtonWidgetState();
  }
}

class AppDropdownButtonWidgetState extends State<AppDropdownButtonWidget> {
  AppListBloc? bloc;

  AppDropdownButtonWidgetState();

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<AppListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (bloc != null) bloc!.close();
    super.dispose();
  }

List<Widget> widgets(AppModel value) {
var app = widget.app;
var widgets = <Widget>[];
widgets.add(value.documentID != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID)) : Container());
widgets.add(value.title != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.title!)) : Container());
return widgets;
}


  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<AppListBloc, AppListState>(builder: (context, state) {
      if (state is AppListLoading) {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      } else if (state is AppListLoaded) {
        int? privilegeChosen = widget.privilegeLevel;
        if ((widget.value != null) && (privilegeChosen == null)) {
          if (state.values != null) {
            var selectedValue = state.values!.firstWhere((v) => (v!.documentID == widget.value), orElse: () => null);
            privilegeChosen = 0;
          }
        }
          
        final values = state.values;
        final items = <DropdownMenuItem<String>>[];
        if (state.values!.isNotEmpty) {
          if (widget.optional != null && widget.optional!) {
            items.add(new DropdownMenuItem<String>(
                value: null,
                child: new Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [ new Text("None") ],
                  ),
                )));
          }
          state.values!.forEach((element) {
            items.add(new DropdownMenuItem<String>(
                value: element!.documentID,
                child: new Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widgets(element),
                  ),
                )));
          });
        }
        return ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: [
          DropdownButton<int>(
            isDense: false,
            isExpanded: false,
            items: [
              DropdownMenuItem<int>(
                value: 0,
                child: text(widget.app, context, 'No privilege Required'),
              ),
              DropdownMenuItem<int>(
                value: 1,
                child: text(widget.app, context, 'Level 1 privilege required'),
              ),
              DropdownMenuItem<int>(
                value: 2,
                child: text(widget.app, context, 'Level 2 privilege required'),
              ),
              DropdownMenuItem<int>(
                value: 3,
                child: text(widget.app, context, 'Must be owner'),
              ),
            ],
            value: privilegeChosen,
            hint: text(widget.app, context, 'Select a privilege'),
            onChanged: _onPrivilegeLevelChange,
          ),
          Row(children: [(false)
            ? Container(
                height: 48, 
                child: DropdownButton<String>(
                      isDense: false,
                      isExpanded: false,
                      items: items,
                      value: widget.value,
                      hint: text(widget.app, context, 'Select a app'),
                      onChanged: _onValueChange,
                    )
                ) 
            : DropdownButton<String>(
                isDense: false,
                isExpanded: false,
                items: items,
                value: widget.value,
                hint: text(widget.app, context, 'Select a app'),
                onChanged: _onValueChange,
              ),
          if (widget.value != null) Spacer(),
          if (widget.value != null) 
            Align(alignment: Alignment.topRight, child: button(
              widget.app,
              context,
              icon: Icon(
                Icons.edit,
              ),
              label: 'Update',
              onPressed: () {
                updateComponent(context, widget.app, 'apps', widget.value, (newValue) {
                  setState(() {
                    widget.value = widget.value;
                  });
                });
              },
            ))
          ])
        ]);
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
      }
    });
  }

  void _onValueChange(String? value) {
    widget.trigger!(value, null);
  }

  void _onPrivilegeLevelChange(int? value) {
    BlocProvider.of<AppListBloc>(context).add(AppChangeQuery(
       newQuery: EliudQuery(theConditions: [
         EliudQueryCondition('conditions.privilegeLevelRequired', isEqualTo: value ?? 0),
         EliudQueryCondition('appId', isEqualTo: widget.app.documentID),]
       ),
     ));
     widget.trigger!(null, value);
  }
}

