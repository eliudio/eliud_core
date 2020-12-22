import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/core/components/page_body_helper.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/dialog_model.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class DialogComponent extends StatelessWidget {
  static Future<void> openDialog(BuildContext context,
      {String id, Map<String, Object> parameters}) async {
    var appId = AccessBloc.appId(context);
    var dialog = await dialogRepository(appId: appId).get(id);
    if (dialog == null) {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text("Error"), content: Text("Dialog with id $id not found")));
      } else {
      await showDialog(
          context: context,
          builder: (context) =>
              Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  elevation: 0,
                  backgroundColor: RgbHelper.color(rgbo: dialog.background),
                  child: DialogComponent(
                      dialog: dialog, parameters: parameters)));
    }
  }

  //  final String appID;
  final DialogModel dialog;
  final Map<String, Object> parameters;

  DialogComponent({this.dialog, this.parameters});

  @override
  Widget build(BuildContext context) {
    var helper = PageBodyHelper();
    var accessState = AccessBloc.getState(context);
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Column(children: <Widget>[
            Text(dialog.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Divider(
              color: Colors.black,
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            helper.theBody(context, accessState,
                backgroundDecoration: null,
                components: helper.getComponents(
                    dialog.bodyComponents, parameters),
                layout: fromDialogLayout(dialog.layout),
                gridView: dialog.gridView),
          ]),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14.0,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
