import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/style/admin/admin_list_style.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultAdminListStyle extends AdminListStyle {
  @override
  Widget floatingActionButton(BuildContext context, String heroTag, Widget child, {VoidCallback? onPressed}) {
    return FloatingActionButton(
      heroTag: heroTag,
      child: child,
      onPressed: onPressed
    );
  }

  @override
  Widget divider(BuildContext context) {
    return Divider(
        height: 1.0,
        thickness: 1.0,);
  }

  @override
  BoxDecoration? boxDecorator(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BoxDecorationHelper.boxDecoration(accessState, null);
  }

  @override
  Widget listItem(BuildContext context, String text) {
    return Text(
      text,
    );
  }

  @override
  Widget progressIndicator(BuildContext context, {Animation<Color>? valueColor}) {
    return Center(child: CircularProgressIndicator(valueColor: valueColor));
  }

}
