import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:eliud_core/tools/action/action_model.dart';
import 'package:eliud_core/model/internal_component.dart';

typedef SetActionValue = Function(ActionModel value);

class ActionField extends StatefulWidget {
  final ActionModel action;
  final SetActionValue setActionValue;
  final String appID;

  ActionField(this.appID, this.action, this.setActionValue);

  @override
  State<StatefulWidget> createState() {
    return ActionFieldState();
  }
}

class ActionFieldState extends State<ActionField> {
  int _actionSelection;
  final List<String> _internalActions = ['Login', 'Logout', 'Login/Logout', 'Flush', 'OtherApps' ];
  String _internalAction;
  String _pageID;
  String _dialogID;
  String _menuDefID;

  @override
  void initState() {
    super.initState();
    final action = widget.action;
    if (action is GotoPage) {
      _actionSelection = 0;
      _pageID = action.pageID;
    } else if (action is OpenDialog) {
      _actionSelection = 3;
      _dialogID = action.dialogID;
    } else if (action is PopupMenu) {
      _actionSelection = 2;
      _menuDefID = action.menuDef.documentID;
    } else if (action is InternalAction) {
      _actionSelection = 1;
      if (action.internalActionEnum == InternalActionEnum.Login) {
        _internalAction = _internalActions[0];
      } else if (action.internalActionEnum == InternalActionEnum.Logout) {
        _internalAction = _internalActions[1];
      } else if (action.internalActionEnum == InternalActionEnum.Flush) {
        _internalAction = _internalActions[2];
      } else if (action.internalActionEnum == InternalActionEnum.OtherApps) {
        _internalAction = _internalActions[3];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = AccessBloc.getState(context);
    var widgets = <Widget>[
      RadioListTile(
        value: 0,
        groupValue: _actionSelection,
        title: Text('Goto Page'),
        subtitle: Text('This action results in moving to another page'),
        onChanged: !state.memberIsOwner() ? null : (val) {
          setSelectionDisplayMode(val);
        },
      ),
      RadioListTile(
        value: 1,
        groupValue: _actionSelection,
        title: Text('Internal'),
        subtitle: Text(
            'This action results in one of the predefined internal actions'),
        onChanged: !state.memberIsOwner() ? null : (val) {
          setSelectionDisplayMode(val);
        },
      ),
      RadioListTile(
        value: 2,
        groupValue: _actionSelection,
        title: Text('Popup Menu'),
        subtitle: Text('This menu item will open another popup menu'),
        onChanged: !state.memberIsOwner() ? null : (val) {
          setSelectionDisplayMode(val);
        },
      ),
    ];

    if (_actionSelection == 0) {
      widgets.add(
          Center(
              child: DropdownButtonComponentFactory().createNew(id: 'pages',
                  value: _pageID,
                  trigger: _onDocumentSelected,
                  optional: false)));
    } else if (_actionSelection == 2) {
      widgets.add(
          Center(
              child: DropdownButtonComponentFactory().createNew(id: 'menuDefs',
                  value: _menuDefID,
                  trigger: _onPopupmenuSelected,
                  optional: false)));
    } else if (_actionSelection == 3) {
      widgets.add(
          Center(
              child: DropdownButtonComponentFactory().createNew(id: 'menuDefs',
                  value: _dialogID,
                  trigger: _onDialogSelected,
                  optional: false)));
    } else {
      List<DropdownMenuItem<String>> items = [];
      for (var ia in _internalActions) {
        items.add(DropdownMenuItem(value: ia, child: Text(ia)));
      }
      widgets.add(Center(
          child: DropdownButton(
        value: _internalAction,
        items: items,
        hint: Text('Select internal action'),
        onChanged: _changedDropDownItem,
      )));
    }

    return Container(
        height: (220),
        child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            children: widgets));
  }

  void setSelectionDisplayMode(int val) {
    setState(() {
      _actionSelection = val;
    });
    if (_actionSelection == 0) widget.setActionValue(GotoPage(widget.appID));
    if (_actionSelection == 1) widget.setActionValue(InternalAction(widget.appID));
    if (_actionSelection == 2) widget.setActionValue(PopupMenu(widget.appID));
  }

  void _onDocumentSelected(value) {
    setState(() {
      _pageID = value;
    });
    if (_actionSelection == 0) {
      widget.setActionValue(new GotoPage(widget.appID, pageID: value));
    }
  }

  Future<void> _onPopupmenuSelected(value) async {
    setState(() {
      _menuDefID = value;
    });
    if (_actionSelection == 2) {
      MenuDefModel menuDef = await menuDefRepository(appId: widget.appID).get(value);
      widget.setActionValue(new PopupMenu(widget.appID, menuDef: menuDef));
    }
  }

  Future<void> _onDialogSelected(value) async {
    setState(() {
      _dialogID = value;
    });
    if (_actionSelection == 3) {
      widget.setActionValue(new OpenDialog(widget.appID, dialogID: value));
    }
  }

  void _changedDropDownItem(String val) {
    setState(() {
      _internalAction = val;
    });
    InternalActionEnum actionEnum = InternalActionEnum.Unknown;
    if (_internalAction == _internalActions[0])
      actionEnum = InternalActionEnum.Login;
    else if (_internalAction == _internalActions[1])
      actionEnum = InternalActionEnum.Logout;
    else if (_internalAction == _internalActions[2])
      actionEnum = InternalActionEnum.Flush;
    else if (_internalAction == _internalActions[3])
      actionEnum = InternalActionEnum.OtherApps;
    if (_actionSelection == 1)
      widget.setActionValue(new InternalAction(widget.appID, internalActionEnum: actionEnum));
  }
}