import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';
import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';
import 'package:flutter/material.dart';
import 'eliud_style.dart';

class EliudAdminFormStyle extends AdminFormStyle {
  final EliudStyle _eliudStyle;

  EliudAdminFormStyle(this._eliudStyle);

  @override
  PreferredSizeWidget constructAppBar(BuildContext context, String title) {
    var accessState = AccessBloc.getState(context);
    return AppBar(
      title: Text(title,
          style: TextStyle(
              color: RgbHelper.color(
                  rgbo: _eliudStyle
                      .eliudStyleAttributesModel.formAppBarTextColor))),
      flexibleSpace: Container(
          decoration: BoxDecorationHelper.boxDecoration(accessState,
              _eliudStyle.eliudStyleAttributesModel.formAppBarBackground)),
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
  Widget groupTitle(BuildContext context, String title) {
    return Text(title,
        style: TextStyle(
            color: RgbHelper.color(
                rgbo:
                    _eliudStyle.eliudStyleAttributesModel.formGroupTitleColor),
            fontWeight: FontWeight.bold));
  }

  @override
  Widget textFormField(BuildContext context, String labelText, IconData icon,
      bool readOnly, TextEditingController _controller, FieldType? fieldType,
      {FormFieldValidator<String>? validator, String? hintText}) {
    return TextFormField(
        style: TextStyle(
            color: RgbHelper.color(
                rgbo:
                    _eliudStyle.eliudStyleAttributesModel.formFieldTextColor)),
        readOnly: readOnly,
        controller: _controller,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldTextColor))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: RgbHelper.color(
                      rgbo: _eliudStyle
                          .eliudStyleAttributesModel.formFieldFocusColor))),
          icon: Icon(icon,
              color: RgbHelper.color(
                  rgbo: _eliudStyle
                      .eliudStyleAttributesModel.formFieldHeaderColor)),
          labelText: labelText,
        ),
        keyboardType: TextInputType.text,
        autovalidate: true,
        validator: validator);
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
  
  @override
  Widget submitButton(BuildContext context, String text, {VoidCallback? onPressed}) {
    return RaisedButton(
      color: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.formSubmitButtonColor),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: RgbHelper.color(rgbo: _eliudStyle.eliudStyleAttributesModel.formSubmitButtonTextColor))),
    );
  }

  @override
  /*
   * This is the container for the entire form
   */
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
