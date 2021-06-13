import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/default_style/shared/eliud_shared_implementation.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import '../eliud_style.dart';

class EliudAdminFormStyle extends EliudSharedImplementation implements AdminFormStyle {
  final EliudStyle _eliudStyle;

  EliudAdminFormStyle(this._eliudStyle) : super(_eliudStyle);

  @override
  Widget groupTitle(BuildContext context, String title) {
    return Text(title,
        style: TextStyle(
            color: RgbHelper.color(
                rgbo:
                    _eliudStyle.eliudStyleAttributesModel.formGroupTitleColor),
            fontWeight: FontWeight.bold));
  }

  @override
  Widget radioListTile<T>(BuildContext context, T t, T? groupValue, String title, String subTitle, ValueChanged<T?>? valueChanged) {
    return RadioListTile(
      value: t,
      activeColor: RgbHelper.color(rgbo: _eliudStyle
          .eliudStyleAttributesModel.formFieldTextColor),
      groupValue: groupValue,
      title: Text(title, style: TextStyle(color: RgbHelper.color(rgbo: _eliudStyle
          .eliudStyleAttributesModel.formFieldTextColor))),
      subtitle: Text(subTitle, style: TextStyle(color: RgbHelper.color(rgbo: _eliudStyle
          .eliudStyleAttributesModel.formFieldTextColor))),
      onChanged: valueChanged
    );
  }

  @override
  Widget checkboxListTile(BuildContext context, String title, bool? value, ValueChanged<bool?>? onChanged) {
    return CheckboxListTile(
        title: Text(title, style: TextStyle(color: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.formFieldTextColor))),
        value: value,
        onChanged: onChanged);
  }

  /*
   * This is the container for the entire form
   */
  @override
  Widget container(BuildContext context, Widget child, FormAction formAction) {
    return Container(
        color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
        decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(AccessBloc.getState(context), _eliudStyle.eliudStyleAttributesModel.formBackground),
        padding:
        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: child
    );
  }

}
