import 'package:eliud_core/model/storage_conditions_model.dart';
import 'package:eliud_core/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConditionsSimpleWidget extends StatefulWidget {
  final StorageConditionsModel value;
  final bool? readOnly;

  ConditionsSimpleWidget({
    Key? key,
    required this.value,
    this.readOnly,
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
    return DropdownButton<int>(
      isDense: false,
      isExpanded: false,
      items: [
        DropdownMenuItem<int>(value: 0,child: text(context, 'No Privilege Required')),
        DropdownMenuItem<int>(value: 1, child: text(context, 'Level 1 Privilege Required')),
        DropdownMenuItem<int>(value: 2, child: text(context, 'Level 2 Privilege Required')),
        DropdownMenuItem<int>(value: 3, child: text(context, 'Owner Required'))
      ],
      value: value,
      hint: text(context, 'Select Privilege'),
      onChanged: widget.readOnly != null && widget.readOnly! ? null : (value) => _onChange(value),
    );
  }

  void _onChange(int? newValue) {
    if (newValue != null) {
      setState(() {
        value = newValue;
        widget.value.privilegeLevelRequired =
            toPrivilegeLevelRequiredSimple(value);
      });
    }
  }
}
