import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/model/menu_def_model.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action_model.dart';
import '../model/internal_component.dart';

typedef SetActionValue(ActionModel value);

class ActionField extends StatefulWidget {
  final ActionModel action;
  final SetActionValue setActionValue;

  ActionField(this.action, this.setActionValue);

  @override
  createState() {
    return new ActionFieldState();
  }
}

class ActionFieldState extends State<ActionField> {
  int _actionSelection;
  List<String> _internalActions = ["Login", "Logout", "Login/Logout", "Flush", "OtherApps" ];
  String _internalAction;
  String _pageID;
  String _menuDefID;

  @override
  void initState() {
    super.initState();
    final ActionModel action = widget.action;
    if (action is GotoPage) {
      _actionSelection = 0;
      _pageID = action.pageID;
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
    List<Widget> widgets = <Widget>[
      RadioListTile(
        value: 0,
        groupValue: _actionSelection,
        title: Text("Goto Page"),
        subtitle: Text("This action results in moving to another page"),
        onChanged: !GlobalData.memberIsOwner() ? null : (val) {
          setSelectionDisplayMode(val);
        },
      ),
      RadioListTile(
        value: 1,
        groupValue: _actionSelection,
        title: Text("Internal"),
        subtitle: Text(
            "This action results in one of the predefined internal actions"),
        onChanged: !GlobalData.memberIsOwner() ? null : (val) {
          setSelectionDisplayMode(val);
        },
      ),
      RadioListTile(
        value: 2,
        groupValue: _actionSelection,
        title: Text("Popup Menu"),
        subtitle: Text("This menu item will open another popup menu"),
        onChanged: !GlobalData.memberIsOwner() ? null : (val) {
          setSelectionDisplayMode(val);
        },
      ),
    ];

    if (_actionSelection == 0) {
      widgets.add(
          new Center(
              child: DropdownButtonComponentFactory().createNew(id: "pages",
                  value: _pageID,
                  trigger: _onDocumentSelected,
                  optional: false)));
    } else if (_actionSelection == 2) {
        widgets.add(
            new Center(
                child: DropdownButtonComponentFactory().createNew(id: "menuDefs",
                    value: _menuDefID,
                    trigger: _onPopupmenuSelected,
                    optional: false)));
    } else {
      List<DropdownMenuItem<String>> items = new List();
      for (String ia in _internalActions) {
        items.add(new DropdownMenuItem(value: ia, child: new Text(ia)));
      }
      widgets.add(new Center(
          child: new DropdownButton(
        value: _internalAction,
        items: items,
        hint: Text("Select internal action"),
        onChanged: _changedDropDownItem,
      )));
    }

    return new Container(
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
    if (_actionSelection == 0) widget.setActionValue(new GotoPage());
    if (_actionSelection == 1) widget.setActionValue(new InternalAction());
    if (_actionSelection == 2) widget.setActionValue(new PopupMenu());
  }

  void _onDocumentSelected(value) {
    setState(() {
      _pageID = value;
    });
    if (_actionSelection == 0)
      widget.setActionValue(new GotoPage(pageID: value));
  }

  Future<void> _onPopupmenuSelected(value) async {
    setState(() {
      _menuDefID = value;
    });
    if (_actionSelection == 2) {
      MenuDefModel menuDef = await AbstractRepositorySingleton.singleton.menuDefRepository().get(value);
      widget.setActionValue(new PopupMenu(menuDef: menuDef));
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
      widget.setActionValue(new InternalAction(internalActionEnum: actionEnum));
  }
}
