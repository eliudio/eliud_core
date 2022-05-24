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

import 'package:eliud_core/model/app_model.dart';
import 'package:eliud_core/core/blocs/access/state/access_state.dart';
import 'package:eliud_core/core/blocs/access/state/logged_in.dart';
import 'package:eliud_core/core/blocs/access/access_bloc.dart';
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
  final AppModel app;
  FormAction formAction;
  PageModel? value;
  ActionModel? submitAction;

  PageForm({Key? key, required this.app, required this.formAction, required this.value, this.submitAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.ShowData) {
      return BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialisePageFormEvent(value: value)),
  
        child: MyPageForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } if (formAction == FormAction.ShowPreloadedData) {
      return BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(appId,
                                       formAction: formAction,

                                                )..add(InitialisePageFormNoLoadEvent(value: value)),
  
        child: MyPageForm(app:app, submitAction: submitAction, formAction: formAction),
          );
    } else {
      return Scaffold(
        appBar: StyleRegistry.registry().styleWithApp(app).adminFormStyle().appBarWithString(app, context, title: formAction == FormAction.UpdateAction ? 'Update Page' : 'Add Page'),
        body: BlocProvider<PageFormBloc >(
            create: (context) => PageFormBloc(appId,
                                       formAction: formAction,

                                                )..add((formAction == FormAction.UpdateAction ? InitialisePageFormEvent(value: value) : InitialiseNewPageFormEvent())),
  
        child: MyPageForm(app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}


class MyPageForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  MyPageForm({required this.app, this.formAction, this.submitAction});

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
  int? _layoutSelectedRadioTile;
  String? _gridView;


  _MyPageFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PageFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _titleController.addListener(_onTitleChanged);
    _layoutSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<PageFormBloc, PageFormState>(builder: (context, state) {
      if (state is PageFormUninitialized) return Center(
        child: StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context),
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
        if (state.value!.layout != null)
          _layoutSelectedRadioTile = state.value!.layout!.index;
        else
          _layoutSelectedRadioTile = 0;
        if (state.value!.gridView != null)
          _gridView= state.value!.gridView!.documentID;
        else
          _gridView= "";
      }
      if (state is PageFormInitialized) {
        List<Widget> children = [];
         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'General')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Document ID', icon: Icons.vpn_key, readOnly: (formAction == FormAction.UpdateAction), textEditingController: _documentIDController, keyboardType: TextInputType.text, validator: (_) => state is DocumentIDPageFormError ? state.message : null, hintText: null)
          );

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().textFormField(widget.app, context, labelText: 'Title', icon: Icons.text_format, readOnly: _readOnly(accessState, state), textEditingController: _titleController, keyboardType: TextInputType.text, validator: (_) => state is TitlePageFormError ? state.message : null, hintText: null)
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Home menu')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "homeMenus", value: _homeMenu, trigger: (value, privilegeLevel) => _onHomeMenuSelected(value), optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Drawer')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "drawers", value: _drawer, trigger: (value, privilegeLevel) => _onDrawerSelected(value), optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'End Drawer')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "drawers", value: _endDrawer, trigger: (value, privilegeLevel) => _onEndDrawerSelected(value), optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'App Bar')
                ));

        children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "appBars", value: _appBar, trigger: (value, privilegeLevel) => _onAppBarSelected(value), optional: true),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Components')
                ));

        children.add(

                new Container(
                    height: (fullScreenHeight(context) / 2.5), 
                    child: bodyComponentsList(widget.app, context, state.value!.bodyComponents, _onBodyComponentsChanged)
                )
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Background')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Layout')
                ));

        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _layoutSelectedRadioTile, 'GridView', 'GridView', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _layoutSelectedRadioTile, 'ListView', 'ListView', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionLayout(val))
          );
        children.add(

                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().radioListTile(widget.app, context, 0, _layoutSelectedRadioTile, 'OnlyTheFirstComponent', 'OnlyTheFirstComponent', !accessState.memberIsOwner(widget.app.documentID) ? null : (dynamic val) => setSelectionLayout(val))
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if (state.value!.layout == PageLayout.GridView) children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'GridView')
                ));

        if ((state.value!.layout == PageLayout.GridView)) children.add(

                DropdownButtonComponentFactory().createNew(app: widget.app, id: "gridViews", value: _gridView, trigger: (value, privilegeLevel) => _onGridViewSelected(value), optional: false),
          );


        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


         children.add(Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().groupTitle(widget.app, context, 'Conditional')
                ));



        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().divider(widget.app, context));


        if ((formAction != FormAction.ShowData) && (formAction != FormAction.ShowPreloadedData))
          children.add(StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app, context, label: 'Submit',
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

        return StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().container(widget.app, context, Form(
            child: ListView(
              padding: const EdgeInsets.all(8),
              physics: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)) ? NeverScrollableScrollPhysics() : null,
              shrinkWrap: ((formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData)),
              children: children as List<Widget>
            ),
          ), formAction!
        );
      } else {
        return StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().progressIndicator(widget.app, context);
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



  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  bool _readOnly(AccessState accessState, PageFormInitialized state) {
    return (formAction == FormAction.ShowData) || (formAction == FormAction.ShowPreloadedData) || (!accessState.memberIsOwner(widget.app.documentID));
  }
  

}



