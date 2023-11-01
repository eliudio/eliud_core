import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

import '../../style/frontend/has_button.dart';

typedef void ConditionsSimpleChanged(int value);

class ConditionsSimpleWidget extends StatefulWidget {
  final AppModel app;
  final StorageConditionsModel value;
  final bool? readOnly;
//  final ConditionsSimpleChanged? conditionsSimpleChanged;

  ConditionsSimpleWidget({
    Key? key,
    required this.app,
    required this.value,
    this.readOnly,
    //this.conditionsSimpleChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ConditionPrivilegeState(value.privilegeLevelRequired != null ? value.privilegeLevelRequired!.index : 0);
  }
}

class _ConditionPrivilegeState extends State<ConditionsSimpleWidget> {
  int value;

  _ConditionPrivilegeState(this.value);

  @override
  Widget build(BuildContext context) {
    return dropdownButton<int>(
      widget.app, context,
      isDense: false,
      isExpanded: false,
      items: [
        DropdownMenuItem<int>(value: 0,child: text(widget.app, context, 'No Privilege Required')),
        DropdownMenuItem<int>(value: 1, child: text(widget.app, context, 'Level 1 Privilege Required')),
        DropdownMenuItem<int>(value: 2, child: text(widget.app, context, 'Level 2 Privilege Required')),
        DropdownMenuItem<int>(value: 3, child: text(widget.app, context, 'Owner Required'))
      ],
      value: value,
      hint: text(widget.app, context, 'Select Privilege'),
      onChanged: widget.readOnly != null && widget.readOnly! ? null : (value) => _onChange(value),
    );
  }

  void _onChange(int? newValue) {
    if (newValue != null) {
      setState(() {
        value = newValue;
        widget.value.privilegeLevelRequired =
            toPrivilegeLevelRequiredSimple(value);
/*
        if (widget.conditionsSimpleChanged != null) {
          widget.conditionsSimpleChanged!(value);
        }
*/
      });
    }
  }
}
