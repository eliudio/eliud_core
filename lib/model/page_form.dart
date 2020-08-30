/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_form.dart
                       
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
import '../model/embedded_component.dart';
import '../tools/bespoke_formfields.dart';
import 'package:eliud_core/tools/bespoke_formfields.dart';

import 'package:eliud_core/tools/enums.dart';
import 'package:eliud_core/tools/etc.dart';

// import the main classes
import 'package:eliud_core/tools/main_abstract_repository_singleton.dart';

// import the shared classes
import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core/model/repository_export.dart';
import 'package:eliud_core/model/model_export.dart';
import 'package:eliud_core/tools/action_model.dart';
import 'package:eliud_core/model/entity_export.dart';
  
// import the classes of this package:
import '../model/abstract_repository_singleton.dart';
import '../model/repository_export.dart';
import 'package:eliud_core/model/repository_export.dart';
import '../model/model_export.dart';
import 'package:eliud_core/model/model_export.dart';
import '../model/entity_export.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'page_list_bloc.dart';
import 'page_list_event.dart';
import 'page_model.dart';
import 'page_form_bloc.dart';
import 'page_form_event.dart';
import 'page_form_state.dart';


class PageForm extends StatelessWidget {
  FormAction formAction;
  PageModel value;
  ActionModel submitAction;

  PageForm({Key key, @required this.formAction, @required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(
                                       formAction: formAction,

                                                )..add(InitialisePageFormEvent(value: value)),
  
        child: MyPageForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(
                                       formAction: formAction,

                                                )..add(InitialisePageFormNoLoadEvent(value: value)),
  
        child: MyPageForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: formAction == FormAction.UpdateAction ?
                AppBar(
                    title: Text("Update Page", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                  ) :
                AppBar(
                    title: Text("Add Page", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formAppBarTextColor))),
                    flexibleSpace: Container(
                        decoration: BoxDecorationHelper.boxDecoration(GlobalData.app().formAppBarBackground)),
                ),
        body: BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePageFormEvent(value: value) : InitialiseNewPageFormEvent())),
  
        child: MyPageForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPageForm extends StatefulWidget {
  final FormAction formAction;
  final ActionModel submitAction;

  MyPageForm({this.formAction, this.submitAction});

  _MyPageFormState createState() => _MyPageFormState(this.formAction);
}


class _MyPageFormState extends State<MyPageForm> {
  final FormAction formAction;
  PageFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String _appBar;
  String _drawer;
  String _endDrawer;
  String _homeMenu;
  String _background;
  int _layoutSelectedRadioTile;
  String _gridView;
  int _conditionalSelectedRadioTile;
  final TextEditingController _pluginConditionController = TextEditingController();


  _MyPageFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PageFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _layoutSelectedRadioTile = 0;
    _conditionalSelectedRadioTile = 0;
    _pluginConditionController.addListener(_onPluginConditionChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageFormBloc, PageFormState>(builder: (context, state) {
      if (state is PageFormUninitialized) return Center(
        child: CircularProgressIndicator(),
      );

      if (state is PageFormLoaded) {
        if (state.value.documentID != null)
          _documentIDController.text = state.value.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value.appId != null)
          _appIdController.text = state.value.appId.toString();
        else
          _appIdController.text = "";
        if (state.value.title != null)
          _titleController.text = state.value.title.toString();
        else
          _titleController.text = "";
        if (state.value.appBar != null)
          _appBar= state.value.appBar.documentID;
        else
          _appBar= "";
        if (state.value.drawer != null)
          _drawer= state.value.drawer.documentID;
        else
          _drawer= "";
        if (state.value.endDrawer != null)
          _endDrawer= state.value.endDrawer.documentID;
        else
          _endDrawer= "";
        if (state.value.homeMenu != null)
          _homeMenu= state.value.homeMenu.documentID;
        else
          _homeMenu= "";
        if (state.value.background != null)
          _background= state.value.background.documentID;
        else
          _background= "";
        if (state.value.layout != null)
          _layoutSelectedRadioTile = state.value.layout.index;
        else
          _layoutSelectedRadioTile = 0;
        if (state.value.gridView != null)
          _gridView= state.value.gridView.documentID;
        else
          _gridView= "";
        if (state.value.conditional != null)
          _conditionalSelectedRadioTile = state.value.conditional.index;
        else
          _conditionalSelectedRadioTile = 0;
        if (state.value.pluginCondition != null)
          _pluginConditionController.text = state.value.pluginCondition.toString();
        else
          _pluginConditionController.text = "";
      }
      if (state is PageFormInitialized) {
        List<Widget> children = List();
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('General',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


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
                    return state is DocumentIDPageFormError ? state.message : null;
                  },
                ),
          );

        children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _titleController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Title',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is TitlePageFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Home menu',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "homeMenus", value: _homeMenu, trigger: _onHomeMenuSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Drawer',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "drawers", value: _drawer, trigger: _onDrawerSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('End Drawer',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "drawers", value: _endDrawer, trigger: _onEndDrawerSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('App Bar',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "appBars", value: _appBar, trigger: _onAppBarSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Components',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: bodyComponentsList(state.value.bodyComponents, _onBodyComponentsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Background',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _background, trigger: _onBackgroundSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Layout',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _layoutSelectedRadioTile,
                    title: Text("GridView", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("GridView", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionLayout(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _layoutSelectedRadioTile,
                    title: Text("ListView", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("ListView", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionLayout(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _layoutSelectedRadioTile,
                    title: Text("OnlyTheFirstComponent", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("OnlyTheFirstComponent", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionLayout(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if (state.value.layout == PageLayout.GridView) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('GridView',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        if ((state.value.layout == PageLayout.GridView)) children.add(

                DropdownButtonComponentFactory().createNew(id: "gridViews", value: _gridView, trigger: _onGridViewSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Conditional',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        children.add(

                RadioListTile(
                    value: 0,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _conditionalSelectedRadioTile,
                    title: Text("Always", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("Always", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionConditional(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 1,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _conditionalSelectedRadioTile,
                    title: Text("MustBeLoggedIn", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("MustBeLoggedIn", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionConditional(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 2,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _conditionalSelectedRadioTile,
                    title: Text("MustNotBeLoggedIn", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("MustNotBeLoggedIn", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionConditional(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 3,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _conditionalSelectedRadioTile,
                    title: Text("PluginDecides", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("PluginDecides", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionConditional(val);
                    },
                ),
          );
        children.add(

                RadioListTile(
                    value: 4,
                    activeColor: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor),
                    groupValue: _conditionalSelectedRadioTile,
                    title: Text("AdminOnly", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    subtitle: Text("AdminOnly", style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),
                    onChanged: !GlobalData.memberIsOwner() ? null : (val) {
                      setSelectionConditional(val);
                    },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if (state.value.conditional == PageCondition.PluginDecides) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text('Plugin Condition',
                      style: TextStyle(
                          color: RgbHelper.color(rgbo: GlobalData.app().formGroupTitleColor), fontWeight: FontWeight.bold)),
                ));

        if ((state.value.conditional == PageCondition.PluginDecides)) children.add(

                TextFormField(
                style: TextStyle(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor)),
                  readOnly: _readOnly(state),
                  controller: _pluginConditionController,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldTextColor))),                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: RgbHelper.color(rgbo: GlobalData.app().formFieldFocusColor))),                    icon: Icon(Icons.text_format, color: RgbHelper.color(rgbo: GlobalData.app().formFieldHeaderColor)),
                    labelText: 'Plugin condition',
                  ),
                  keyboardType: TextInputType.text,
                  autovalidate: true,
                  validator: (_) {
                    return state is PluginConditionPageFormError ? state.message : null;
                  },
                ),
          );


        children.add(Container(height: 20.0));
        children.add(Divider(height: 1.0, thickness: 1.0, color: RgbHelper.color(rgbo: GlobalData.app().dividerColor)));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(RaisedButton(
                  color: RgbHelper.color(rgbo: GlobalData.app().formSubmitButtonColor),
                  onPressed: _readOnly(state) ? null : () {
                    if (state is PageFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PageListBloc>(context).add(
                          UpdatePageList(value: state.value.copyWith(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              appBar: state.value.appBar, 
                              drawer: state.value.drawer, 
                              endDrawer: state.value.endDrawer, 
                              homeMenu: state.value.homeMenu, 
                              bodyComponents: state.value.bodyComponents, 
                              background: state.value.background, 
                              layout: state.value.layout, 
                              gridView: state.value.gridView, 
                              conditional: state.value.conditional, 
                              pluginCondition: state.value.pluginCondition, 
                        )));
                      } else {
                        BlocProvider.of<PageListBloc>(context).add(
                          AddPageList(value: PageModel(
                              documentID: state.value.documentID, 
                              appId: state.value.appId, 
                              title: state.value.title, 
                              appBar: state.value.appBar, 
                              drawer: state.value.drawer, 
                              endDrawer: state.value.endDrawer, 
                              homeMenu: state.value.homeMenu, 
                              bodyComponents: state.value.bodyComponents, 
                              background: state.value.background, 
                              layout: state.value.layout, 
                              gridView: state.value.gridView, 
                              conditional: state.value.conditional, 
                              pluginCondition: state.value.pluginCondition, 
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
    _myFormBloc.add(ChangedPageDocumentID(value: _documentIDController.text));
  }


  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPageAppId(value: _appIdController.text));
  }


  void _onTitleChanged() {
    _myFormBloc.add(ChangedPageTitle(value: _titleController.text));
  }


  void _onAppBarSelected(String val) {
    setState(() {
      _appBar = val;
    });
    _myFormBloc.add(ChangedPageAppBar(value: val));
  }


  void _onDrawerSelected(String val) {
    setState(() {
      _drawer = val;
    });
    _myFormBloc.add(ChangedPageDrawer(value: val));
  }


  void _onEndDrawerSelected(String val) {
    setState(() {
      _endDrawer = val;
    });
    _myFormBloc.add(ChangedPageEndDrawer(value: val));
  }


  void _onHomeMenuSelected(String val) {
    setState(() {
      _homeMenu = val;
    });
    _myFormBloc.add(ChangedPageHomeMenu(value: val));
  }


  void _onBodyComponentsChanged(value) {
    _myFormBloc.add(ChangedPageBodyComponents(value: value));
    setState(() {});
  }


  void _onBackgroundSelected(String val) {
    setState(() {
      _background = val;
    });
    _myFormBloc.add(ChangedPageBackground(value: val));
  }


  void setSelectionLayout(int val) {
    setState(() {
      _layoutSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPageLayout(value: toPageLayout(val)));
  }


  void _onGridViewSelected(String val) {
    setState(() {
      _gridView = val;
    });
    _myFormBloc.add(ChangedPageGridView(value: val));
  }


  void setSelectionConditional(int val) {
    setState(() {
      _conditionalSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPageConditional(value: toPageCondition(val)));
  }


  void _onPluginConditionChanged() {
    _myFormBloc.add(ChangedPagePluginCondition(value: _pluginConditionController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _pluginConditionController.dispose();
    super.dispose();
  }

  bool _readOnly(PageFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!GlobalData.memberIsOwner());
  }
  

}



