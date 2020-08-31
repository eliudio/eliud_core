/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 font_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:intl/intl.dart';

import 'package:eliud_core/eliud.dart';

import 'package:eliud_core/model/internal_component.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/embedded_component.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_entity.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/font_list_bloc.dart';
import 'package:eliud_core/model/font_list_event.dart';
import 'package:eliud_core/model/font_model.dart';
import 'package:eliud_core/model/font_form_bloc.dart';
import 'package:eliud_core/model/font_form_event.dart';
import 'package:eliud_core/model/font_form_state.dart';


class FontForm extends StatelessWidget {
  FormAction formAction;
  FontModel value;
  ActionModel submitAction;

  FontForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<FontFormBloc >(
            create: (context) => FontFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseFontFormEvent(value: value)),
  
        child: MyFontForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<FontFormBloc >(
            create: (context) => FontFormBloc(
                                       formAction: formAction,

                                                )..add(InitialiseFontFormNoLoadEvent(value: value)),
  
        child: MyFontForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Font", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Font", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<FontFormBloc >(
            create: (context) => FontFormBloc(
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialiseFontFormEvent(value: value) : InitialiseNewFontFormEvent())),
  
        child: MyFontForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyFontForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyFontForm({this.formAction, this.submitAction});

  _MyFontFormState createState() => _MyFontFormState(this.formAction);
}


class _MyFontFormState extends State<MyFontForm> {
  final FormAction formAction;
  FontFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _fontNameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  int _weightSelectedRadioTile;
  int _styleSelectedRadioTile;
  int _decorationSelectedRadioTile;


  _MyFontFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FontFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _fontNameController.addListener(_onFontNameChanged);
    _sizeController.addListener(_onSizeChanged);
    _weightSelectedRadioTile = 0;
    _styleSelectedRadioTile = 0;
    _decorationSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FontFormBloc, FontFormState>(builder: (context, state) {
      if (state is FontFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is FontFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.fontName != null)
          _fontNameController.text = state.value.fontName.toString();
        else
          _fontNameController.text = "";
        if (state.value.size != null)
          _sizeController.text = state.value.size.toString();
        else
          _sizeController.text = "";
        if (state.value.weight != null)
          _weightSelectedRadioTile = state.value.weight.index;
        else
          _weightSelectedRadioTile = 0;
        if (state.value.style != null)
          _styleSelectedRadioTile = state.value.style.index;
        else
          _styleSelectedRadioTile = 0;
        if (state.value.decoration != null)
          _decorationSelectedRadioTile = state.value.decoration.index;
        else
          _decorationSelectedRadioTile = 0;
      }
      if (state is FontFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: (formAction == FormAction.UpdateAction),
                  controller: _documentIDController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.vpn_key, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Document ID',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is DocumentIDFontFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _fontNameController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Font Family Name (currently supported family is Google Fonts)',
                    hintText: "See https://fonts.google.com/",
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is FontNameFontFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _sizeController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Size',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidate: true,
                  validator: (_) {
                    return state is SizeFontFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Weight',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("Thin", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Thin", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("ExtraLight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ExtraLight", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("Light", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Light", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("Normal", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Normal", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("Medium", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Medium", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 5,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("SemiBold", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("SemiBold", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 6,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("Bold", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Bold", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 7,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("ExtraBold", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ExtraBold", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 8,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _weightSelectedRadioTile,
                    title: Text("MostThick", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("MostThick", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionWeight(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Style',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _styleSelectedRadioTile,
                    title: Text("Italic", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Italic", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionStyle(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _styleSelectedRadioTile,
                    title: Text("Normal", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Normal", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionStyle(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Decoration',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _decorationSelectedRadioTile,
                    title: Text("None", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("None", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionDecoration(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _decorationSelectedRadioTile,
                    title: Text("Underline", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Underline", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionDecoration(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _decorationSelectedRadioTile,
                    title: Text("Overline", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Overline", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionDecoration(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _decorationSelectedRadioTile,
                    title: Text("LineThrough", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("LineThrough", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionDecoration(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Font Color',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RgbField("Font Color", state.value.color, _onColorChanged)
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is FontFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<FontListBloc>(context).add(
                          UpdateFontList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              fontName: state.value.fontName, 
                              size: state.value.size, 
                              weight: state.value.weight, 
                              style: state.value.style, 
                              decoration: state.value.decoration, 
                              color: state.value.color, 
                        )));
                      } else {
                        BlocProvider.of<FontListBloc>(context).add(
                          AddFontList(value: FontModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              fontName: state.value.fontName, 
                              size: state.value.size, 
                              weight: state.value.weight, 
                              style: state.value.style, 
                              decoration: state.value.decoration, 
                              color: state.value.color, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction);
                      } else {
                        Navigator.pop(context);
                      }
                      return true;
                    }
                  },
                  child: Text('Submit', style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonTextColor))),
                ));

        return Container(
          color: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? Colors.transparent : null,
          decoration: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? null : BoxDecorationHelper.boxDecoration(GlobalData.app().formBackground),
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
            child: Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children
            ),
          )
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc.add(ChangedFontDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFontAppId(value: _appIdController.text));
  }


  void _onFontNameChanged() {
    _myFormBloc.add(ChangedFontFontName(value: _fontNameController.text));
  }


  void _onSizeChanged() {
    _myFormBloc.add(ChangedFontSize(value: _sizeController.text));
  }


  void setSelectionWeight(int val) {
    setState(() {
      _weightSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFontWeight(value: toEliudFontWeight(val)));
  }


  void setSelectionStyle(int val) {
    setState(() {
      _styleSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFontStyle(value: toEliudFontStyle(val)));
  }


  void setSelectionDecoration(int val) {
    setState(() {
      _decorationSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFontDecoration(value: toEliudFontDecoration(val)));
  }


  void _onColorChanged(value) {
    _myFormBloc.add(ChangedFontColor(value: value));
    
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _fontNameController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  bool _readOnly(FontFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



