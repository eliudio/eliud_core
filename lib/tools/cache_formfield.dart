import 'file:///C:/src/eliud/eliud_core/lib/eliud.dart';
import 'package:eliud_core/core/global_data.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/*
import 'action_model.dart';
import 'internal_component.dart';
*/

typedef ChangeCacheField(String value);

class CacheField extends StatefulWidget {
  final String value;
  final ChangeCacheField trigger;

  CacheField(this.value, this.trigger);

  @override
  createState() {
    return new CacheFieldState();
  }
}

class CacheFieldState extends State<CacheField> {
  final Uuid uuid = Uuid();
  String value;

  @override
  void initState() {
    super.initState();
    this.value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(
      color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
      onPressed: () {
        value = uuid.v4();
        widget.trigger(value);
      },
      child: Text('Flush', style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonTextColor))),
    );
  }
}
