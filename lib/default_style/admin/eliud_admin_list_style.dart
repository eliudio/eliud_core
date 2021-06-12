import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/style/admin/admin_list_style.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import '../eliud_style.dart';

class EliudAdminListStyle extends AdminListStyle {
  final EliudStyle _eliudStyle;

  EliudAdminListStyle(this._eliudStyle);

  @override
  Widget floatingActionButton(BuildContext context, String heroTag, Widget child, {VoidCallback? onPressed}) {
    return FloatingActionButton(
      heroTag: heroTag,
      foregroundColor: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.floatingButtonForegroundColor),
      backgroundColor: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.floatingButtonBackgroundColor),
      child: child,
      onPressed: onPressed
    );
  }

  @override
  Widget divider(BuildContext context) {
    return Divider(
        height: 1.0,
        thickness: 1.0,
        color: RgbHelper.color(
            rgbo: _eliudStyle.eliudStyleAttributesModel.dividerColor));
  }

  @override
  BoxDecoration? boxDecorator(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BoxDecorationHelper.boxDecoration(accessState, _eliudStyle.eliudStyleAttributesModel.listBackground);
  }

  @override
  Widget listItem(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(color: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.listTextItemColor)),
    );
  }

}
