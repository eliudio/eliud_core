import 'package:eliud_core/model/conditions_simple_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConditionsSimpleWidget extends StatefulWidget {
  final ConditionsSimpleModel value;

  ConditionsSimpleWidget({
    Key? key,
    required this.value,
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
        DropdownMenuItem<int>(value: 0,child: Text('No Privilege Required')),
        DropdownMenuItem<int>(value: 1, child: Text('Level 1 Privilege Required')),
        DropdownMenuItem<int>(value: 2, child: Text('Level 2 Privilege Required')),
        DropdownMenuItem<int>(value: 3, child: Text('Owner Required'))
      ],
      value: value,
      hint: Text('Select Privilege'),
      onChanged: (value) => _onChange(value),
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
