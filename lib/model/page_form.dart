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

import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:eliud_core/tools/common_tools.dart';
import 'package:eliud_core/style/style_registry.dart';
import 'package:eliud_core/style/admin/admin_form_style.dart';

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
import '../tools/bespoke_models.dart';
import 'package:eliud_core/model/model_export.dart';
import '../tools/bespoke_entities.dart';
import 'package:eliud_core/model/entity_export.dart';

import 'package:eliud_core/model/page_list_bloc.dart';
import 'package:eliud_core/model/page_list_event.dart';
import 'package:eliud_core/model/page_model.dart';
import 'package:eliud_core/model/page_form_bloc.dart';
import 'package:eliud_core/model/page_form_event.dart';
import 'package:eliud_core/model/page_form_state.dart';


class PageForm extends StatelessWidget {
  FormAction formAction;
  PageModel? value;
  ActionModel? submitAction;

  PageForm({Key? key, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var app = AccessBloc.app(context);
    if (app == null) return Text("No app available");
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePageFormEvent(value: value)),
  
        child: MyPageForm(submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add(InitialisePageFormNoLoadEvent(value: value)),
  
        child: MyPageForm(submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithContext(context).adminFormStyle().appBarWithString(context, title: formAction == FormAction.UpdateAction ? 'Update Page' : 'Add Page'),
        body: BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(AccessBloc.appId(context),
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePageFormEvent(value: value) : InitialiseNewPageFormEvent())),
  
        child: MyPageForm(submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPageForm extends StatefulWidget {
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyPageForm({this.formAction, this.submitAction});

  _MyPageFormState createState() => _MyPageFormState(this.formAction);
}


class _MyPageFormState extends State<MyPageForm> {
  final FormAction? formAction;
  late PageFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String? _appBar;
  String? _drawer;
  String? _endDrawer;
  String? _homeMenu;
  String? _backgroundOverride;
  int? _layoutSelectedRadioTile;
  String? _gridView;
  final TextEditingController _widgetWrapperController = TextEditingController();


  _MyPageFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PageFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _layoutSelectedRadioTile = 0;
    _widgetWrapperController.addListener(_onWidgetWrapperChanged);
  }

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    if (app == null) return Text('No app available');
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PageFormBloc, PageFormState>(builder: (context, state) {
      if (state is PageFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context),
      );

      if (state is PageFormLoaded) {
        if (state.value!.documentID != null)
          _documentIDController.text = state.value!.documentID.toString();
        else
          _documentIDController.text = "";
        if (state.value!.appId != null)
          _appIdController.text = state.value!.appId.toString();
        else
          _appIdController.text = "";
        if (state.value!.title != null)
          _titleController.text = state.value!.title.toString();
        else
          _titleController.text = "";
        if (state.value!.appBar != null)
          _appBar= state.value!.appBar!.documentID;
        else
          _appBar= "";
        if (state.value!.drawer != null)
          _drawer= state.value!.drawer!.documentID;
        else
          _drawer= "";
        if (state.value!.endDrawer != null)
          _endDrawer= state.value!.endDrawer!.documentID;
        else
          _endDrawer= "";
        if (state.value!.homeMenu != null)
          _homeMenu= state.value!.homeMenu!.documentID;
        else
          _homeMenu= "";
        if (state.value!.backgroundOverride != null)
          _backgroundOverride= state.value!.backgroundOverride!.documentID;
        else
          _backgroundOverride= "";
        if (state.value!.layout != null)
          _layoutSelectedRadioTile = state.value!.layout!.index;
        else
          _layoutSelectedRadioTile = 0;
        if (state.value!.gridView != null)
          _gridView= state.value!.gridView!.documentID;
        else
          _gridView= "";
        if (state.value!.widgetWrapper != null)
          _widgetWrapperController.text = state.value!.widgetWrapper.toString();
        else
          _widgetWrapperController.text = "";
      }
      if (state is PageFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDPageFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Title', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitlePageFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().textFormField(context, labelText: 'Shared Widget Wrapper', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _widgetWrapperController, keyboardType: TextInputType.text, validator: (_) => state is WidgetWrapperPageFormError ? state.message : null, hintText: 'field.remark')
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Home menu')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "homeMenus", value: _homeMenu, trigger: _onHomeMenuSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Drawer')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "drawers", value: _drawer, trigger: _onDrawerSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'End Drawer')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "drawers", value: _endDrawer, trigger: _onEndDrawerSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'App Bar')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "appBars", value: _appBar, trigger: _onAppBarSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Components')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: bodyComponentsList(context, state.value!.bodyComponents, _onBodyComponentsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Background')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(id: "backgrounds", value: _backgroundOverride, trigger: _onBackgroundOverrideSelected, optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Layout')
                ));

        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _layoutSelectedRadioTile, 'GridView', 'GridView', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _layoutSelectedRadioTile, 'ListView', 'ListView', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithContext(context).adminFormStyle().radioListTile(context, 0, _layoutSelectedRadioTile, 'OnlyTheFirstComponent', 'OnlyTheFirstComponent', !accessState.memberIsOwner() ? null : (dynamic val) => setSelectionLayout(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if (state.value!.layout == PageLayout.GridView) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'GridView')
                ));

        if ((state.value!.layout == PageLayout.GridView)) children.add(

                DropdownButtonComponentFactory().createNew(id: "gridViews", value: _gridView, trigger: _onGridViewSelected, optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithContext(context).adminFormStyle().groupTitle(context, 'Conditional')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().divider(context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithContext(context).adminFormStyle().button(context, label: 'Submit',
                  onPressed: _readOnly(accessState, state) ? null : () {
                    if (state is PageFormError) {
                      return null;
                    } else {
                      if (formAction == FormAction.UpdateAction) {
                        BlocProvider.of<PageListBloc>(context).add(
                          UpdatePageList(value: state.value!.copyWith(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              appBar: state.value!.appBar, 
                              drawer: state.value!.drawer, 
                              endDrawer: state.value!.endDrawer, 
                              homeMenu: state.value!.homeMenu, 
                              bodyComponents: state.value!.bodyComponents, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              layout: state.value!.layout, 
                              gridView: state.value!.gridView, 
                              widgetWrapper: state.value!.widgetWrapper, 
                              conditions: state.value!.conditions, 
                        )));
                      } else {
                        BlocProvider.of<PageListBloc>(context).add(
                          AddPageList(value: PageModel(
                              documentID: state.value!.documentID, 
                              appId: state.value!.appId, 
                              title: state.value!.title, 
                              appBar: state.value!.appBar, 
                              drawer: state.value!.drawer, 
                              endDrawer: state.value!.endDrawer, 
                              homeMenu: state.value!.homeMenu, 
                              bodyComponents: state.value!.bodyComponents, 
                              backgroundOverride: state.value!.backgroundOverride, 
                              layout: state.value!.layout, 
                              gridView: state.value!.gridView, 
                              widgetWrapper: state.value!.widgetWrapper, 
                              conditions: state.value!.conditions, 
                          )));
                      }
                      if (widget.submitAction != null) {
                        eliudrouter.Router.navigateTo(context, widget.submitAction!);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  },
                ));

        return StyleRegistry.registry().styleWithContext(context).adminFormStyle().container(context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithContext(context).adminListStyle().progressIndicator(context);
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


  void _onAppBarSelected(String? val) {
    setState(() {
      _appBar = val;
    });
    _myFormBloc.add(ChangedPageAppBar(value: val));
  }


  void _onDrawerSelected(String? val) {
    setState(() {
      _drawer = val;
    });
    _myFormBloc.add(ChangedPageDrawer(value: val));
  }


  void _onEndDrawerSelected(String? val) {
    setState(() {
      _endDrawer = val;
    });
    _myFormBloc.add(ChangedPageEndDrawer(value: val));
  }


  void _onHomeMenuSelected(String? val) {
    setState(() {
      _homeMenu = val;
    });
    _myFormBloc.add(ChangedPageHomeMenu(value: val));
  }


  void _onBodyComponentsChanged(value) {
    _myFormBloc.add(ChangedPageBodyComponents(value: value));
    setState(() {});
  }


  void _onBackgroundOverrideSelected(String? val) {
    setState(() {
      _backgroundOverride = val;
    });
    _myFormBloc.add(ChangedPageBackgroundOverride(value: val));
  }


  void setSelectionLayout(int? val) {
    setState(() {
      _layoutSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPageLayout(value: toPageLayout(val)));
  }


  void _onGridViewSelected(String? val) {
    setState(() {
      _gridView = val;
    });
    _myFormBloc.add(ChangedPageGridView(value: val));
  }


  void _onWidgetWrapperChanged() {
    _myFormBloc.add(ChangedPageWidgetWrapper(value: _widgetWrapperController.text));
  }



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    _widgetWrapperController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, PageFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner());
  }
  

}



