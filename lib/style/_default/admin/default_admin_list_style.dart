import 'package:eliud_core/core/blocs/access/access_bloc.dart';
import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/model/member_model.dart';
import 'package:eliud_core/style/admin/admin_list_style.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';

class DefaultAdminListStyle extends AdminListStyle {
  @override
  Widget floatingActionButton(AppModel app, BuildContext context, String heroTag, Widget child, {VoidCallback? onPressed}) {
    return FloatingActionButton(
      heroTag: heroTag,
      child: child,
      onPressed: onPressed
    );
  }

  @override
  Widget divider(AppModel app, BuildContext context) {
    return Divider(
        height: 1.0,
        thickness: 1.0,);
  }

  @override
  BoxDecoration? boxDecorator(AppModel app, BuildContext context, MemberModel? member) {
    var accessState = AccessBloc.getState(context);
    return BoxDecorationHelper.boxDecoration(member, null);
  }

  @override
  Widget listItem(AppModel app, BuildContext context, String text) {
    return Text(
      text,
    );
  }

  @override
  Widget progressIndicator(AppModel app, BuildContext context, {Animation<Color>? valueColor}) {
    return Center(child: CircularProgressIndicator(valueColor: valueColor));
  }

}
